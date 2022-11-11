<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\PublicLink;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class PublicLinkController extends Controller
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

        $publicLinks = PublicLink::where('user', $loggedId)->orderBy('sequence', 'ASC')->paginate(10);

        return view('admin.publicLinks.index', [
            'publicLinks' => $publicLinks
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.publicLinks.create');
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
            'description',
            'url',
            'sequence'
        ]);
        
        $data['user'] = $loggedId;

        $validator = Validator::make($data, [
            'description' => ['required', 'string', 'max:100'],
            'url' => ['required', 'string'],
            'sequence' => ['required', 'string']
        ]);

        if($validator->fails()) {
            return redirect()->route('publicLinks.create')
            ->withErrors($validator)
            ->withInput();
        }

        $publicLink = new PublicLink;
        $publicLink->description = $data['description'];
        $publicLink->url = $data['url'];
        $publicLink->sequence = $data['sequence'];
        $publicLink->user = $data['user'];
        $publicLink->save();

        return redirect()->route('publicLinks.index');
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
        $publicLink =  PublicLink::find($id);

        if($publicLink) {
            return view('admin.publicLinks.edit', [
                'publicLink' => $publicLink
            ]);
        }

        return redirect()->route('publicLinks.index');
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
        $publicLink = PublicLink::find($id);

        if($publicLink) {
            $data = $request->only([
                'description',
                'url',
                'sequence',
            ]);
        
            $validator = Validator::make($data, [
                'description' => ['required', 'string', 'max:100'],
                'url' => ['required', 'string'],
                'sequence' => ['required', 'string']
            ]);
        }
                
        if($validator->fails()) {
            return redirect()->route('publicLinks.edit',[
                'publicLink' => $id
            ])
            ->withErrors($validator)
            ->withInput();
        }

        $publicLink->description = $data['description'];
        $publicLink->url = $data['url'];
        $publicLink->sequence = $data['sequence'];
        $publicLink->save();

        return redirect()->route('publicLinks.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $publicLink = PublicLink::find($id);
        $publicLink->delete();

        return redirect()->route('publicLinks.index');
    }
}
