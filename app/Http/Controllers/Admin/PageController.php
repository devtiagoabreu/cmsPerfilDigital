<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Page;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class PageController extends Controller
{

    public function __construct() {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $loggedId = intval( Auth::id() );

        //var_dump($loggedId);

        $pages = Page::where('user', $loggedId)->paginate(10);;

        //$pages = Page::paginate(10);

        return view('admin.pages.index', [
            'pages' => $pages
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.pages.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $loggedId = intval( Auth::id() );

        $data = $request->only([
            'title',
            'body',
            'product_token',
            'photo',
            'cover'
        ]);
        $data['slug'] = Str::slug($data['title'], '-');

        $data['user'] = $loggedId;

        $validator = Validator::make($data, [
            'title' => ['required', 'string', 'max:100'],
            'body' => ['string'],
            'slug' => ['required', 'string', 'max:100', 'unique:pages'],
            'product_token' => ['string'],
            //'photo' => ['string'],
            //'cover' => ['string'],
        ]);

        if($validator->fails()) {
            return redirect()->route('pages.create')
            ->withErrors($validator)
            ->withInput();
        }

        $page = new Page;
        $page->title = $data['title'];
        $page->slug = $data['slug'];
        $page->body = $data['body'];
        $page->user = $data['user'];
        $page->product_token = $data['product_token'];

        if($request->hasFile('photo') && $request->file('photo')->isValid()) {
            $dataImage = $request->photo;
            $extension = $dataImage->extension();
            $imageName = md5($dataImage->getClientOriginalName() . strtotime('now')) . '.' . $extension;
            $request->photo->move(public_path('assets/img/pages'), $imageName);
            $page->photo = $imageName;
        }

        if($request->hasFile('cover') && $request->file('cover')->isValid()) {
            $requestImage = $request->cover;
            $extension = $requestImage->extension();
            $imageName = md5($requestImage->getClientOriginalName() . strtotime('now')) . '.' . $extension;
            $request->cover->move(public_path('assets/img/pages'), $imageName);
            $page->cover = $imageName;
        }
        
        $page->save();

        return redirect()->route('pages.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $page = Page::find($id);

        if($page) {
            return view('admin.pages.edit', [
                'page' => $page
            ]);
        }

        return redirect()->route('pages.index');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $page = Page::find($id);

        if($page) {
            $data = $request->only([
                'title',
                'body',
                'product_token',
                'photo',
                'cover',
            ]);
            
            if($page['title'] !== $data['title']) {
                $data['slug'] = Str::slug($data['title'], '-');

                $validator = Validator::make($data, [
                    'title' => ['required', 'string', 'max:100'],
                    'body' => ['string'],
                    'slug' => ['required', 'string', 'max:100', 'unique:pages'],
                    'product_token' => ['string'],
                    //'photo' => ['image|mimes:jpg,png,jpeg,gif,svg|max:2048|dimensions:min_width=100,min_height=100,max_width=1000,max_height=1000'],
                    //'cover' => ['image|mimes:jpg,png,jpeg,gif,svg|max:2048|dimensions:min_width=100,min_height=100,max_width=1000,max_height=1000'],
                ]);
            } else {
                $validator = Validator::make($data, [
                    'title' => ['required', 'string', 'max:100'],
                    'body' => ['string'],
                    'product_token' => ['string'],
                    //'photo' => ['image|mimes:jpg,png,jpeg,gif,svg|max:2048|dimensions:min_width=100,min_height=100,max_width=1000,max_height=1000'],
                    //'cover' => ['image|mimes:jpg,png,jpeg,gif,svg|max:2048|dimensions:min_width=100,min_height=100,max_width=1000,max_height=1000'],
                ]);
            }

            if($validator->fails()) {
                return redirect()->route('pages.edit',[
                    'page' => $id
                ])
                ->withErrors($validator)
                ->withInput();
            }

            $page->title = $data['title'];
            $page->body = $data['body'];
            $page->product_token = $data['product_token'];
            

            if($request->hasFile('photo') && $request->file('photo')->isValid()) {
                $dataImage = $request->photo;
                $extension = $dataImage->extension();
                $imageName = md5($dataImage->getClientOriginalName() . strtotime('now')) . '.' . $extension;
                $request->photo->move(public_path('assets/img/pages'), $imageName);
                $page->photo = $imageName;
            }
    
            if($request->hasFile('cover') && $request->file('cover')->isValid()) {
                $requestImage = $request->cover;
                $extension = $requestImage->extension();
                $imageName = md5($requestImage->getClientOriginalName() . strtotime('now')) . '.' . $extension;
                $request->cover->move(public_path('assets/img/pages'), $imageName);
                $page->cover = $imageName;
            }


            if(!empty($data['slug'])) {
                $page->slug = $data['slug'];
            }

            $page->save();
        }

        return redirect()->route('pages.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $page = Page::find($id);
        $page->delete();

        return redirect()->route('pages.index');
    }
}
