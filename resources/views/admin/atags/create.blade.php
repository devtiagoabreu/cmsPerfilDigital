@extends('adminlte::page')

@section('title', 'Nova atag')

@section('content_header')
    <h1>Nova atag</h1>
@endsection

@section('content')

    @if($errors->any())
        <div class="alert alert-danger">
            <ul>
                <h5><i class="icon fas fa-ban"></i>Ocorreu um erro.</h5>

                @foreach($errors->all() as $error)
                    <li>{{$error}}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            <form action="{{route('atags.store')}}" method="POST" class="form-horizontal" enctype="multpart/form-data">
                @csrf
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Id da Página</label>
                    <div class="col-sm-10">
                        <select name="page" value="{{old('page')}}" class="form-control @error('page') is-invalid @enderror">
                        @foreach($pages as $page)    
                        <option>{{$page->id}}</option>    
                        @endforeach   
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Tipo</label>
                    <div class="col-sm-10">
                        <select name="tag_type" value="{{old('tag_type')}}" class="form-control @error('tag_type') is-invalid @enderror">
                            <option>Facebook</option>
                            <option>Instagram</option>
                            <option>Twitter</option>
                            <option>Linkedin</option>
                            <option>TikTok</option>
                            <option>Whatsapp</option>
                            <option>Youtube</option>
                            <option>Site</option>
                            <option>Profissão</option>
                            <option>E-mail</option>
                            <option>Celular</option>
                            <option>Telefone</option>
                            <option>Endereço</option>
                            <option>pix</option>
                            <option>GitHub</option>
                            <option>Nome</option>
                            <option>gtag</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">atag</label>
                    <div class="col-sm-10">
                        <input type="text" name="value" value="{{old('value')}}" class="form-control @error('value') is-invalid @enderror" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Sequência</label>
                    <div class="col-sm-10">
                        <input type="text" name="sequence" value="{{old('sequence')}}" class="form-control @error('sequence') is-invalid @enderror" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"></label>
                    <div class="col-sm-10">
                        <input type="submit" value="Criar" class="btn btn-success" />
                    </div>
                </div>
        
            </form>
        </div>
    </div>

<!--<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"></script>-->
<script>

tinymce.init({
    selector:'textarea.bodyfield',
    height:300,
    menubar:false,
    plugins:['link', 'table', 'image', 'autoresize', 'lists'],
    toolbar:'undo redo | formatselect | bold italic backcolor | alignleft aligncenter alignright alignjustify | table | link image | bullist numlist',
    content_css:[
        '{{asset('assets/css/content.css')}}'
    ],
    images_upload_url:'{{route('imageupload')}}',
    images_upload_credentials:true,
    convert_urls:false
});

</script>

@endsection