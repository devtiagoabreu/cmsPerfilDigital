<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Atag;
use App\User;
use App\Page;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AtagController extends Controller
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

        $atags = Atag::where('user', $loggedId)
            ->orderBy('page', 'ASC',)
            ->orderBy('sequence', 'ASC',)->paginate(10);

        return view('admin.atags.index', [
            'atags' => $atags
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $loggedId = intval( Auth::id() );

        $pages = Page::where('user', $loggedId)->paginate(100);;

        return view('admin.atags.create', [
            'pages' => $pages
        ]);
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
            'page',
            'tag_type',
            'value',
            'sequence'
        ]);
        
        $data['user'] = $loggedId;

        $validator = Validator::make($data, [
            'page' => ['required', 'int'],
            'tag_type' => ['required', 'string'],
            'value' => ['string'],
            'sequence' => ['required', 'string']
        ]);

        if($validator->fails()) {
            return redirect()->route('atags.create')
            ->withErrors($validator)
            ->withInput();
        }

        $atag = new Atag;
        $atag->page = $data['page'];
        $atag->tag_type = $data['tag_type'];
        $atag->value = $data['value'];
        $atag->sequence = $data['sequence'];
        $atag->user = $data['user'];
        $atag->save();

        return redirect()->route('atags.index');
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
        $atag = Atag::find($id);

        if($atag) {
            return view('admin.atags.edit', [
                'atag' => $atag
            ]);
        }

        return redirect()->route('atags.index');
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
        $atag = Atag::find($id);

        if($atag) {
            $data = $request->only([
                'page',
                'tag_type',
                'value',
                'sequence'
            ]);
                        
            $validator = Validator::make($data, [
                'page' => ['required', 'int'],
                'tag_type' => ['required', 'string'],
                'value' => ['string'],
                'sequence' => ['required', 'string']
            ]);
    
            if($validator->fails()) {
                return redirect()->route('atags.create')
                ->withErrors($validator)
                ->withInput();
            }

            $atag->page = $data['page'];
            $atag->tag_type = $data['tag_type'];
            $atag->value = $data['value'];
            $atag->sequence = $data['sequence'];
            $atag->save();
        }

        return redirect()->route('atags.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
