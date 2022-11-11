@extends('adminlte::page')

@section('title', 'Atags')

@section('content_header')
    <h1>
        Minhas atags
        <a href="{{ route('atags.create') }}" class="btn btn-sm btn-success">Nova aTag</a>
    </h1>
@endsection

@section('content')

<div class="card">
    <div class="card-body">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Id da Página</th>
                    <th>Tipo</th>
                    <th hidden=true>aTag</th>
                    <th hidden=true>Sequência</th>
                    <th width="200">Ações</th>
                </tr>
            </thead>
            <tbody>
            @foreach($atags as $atag)
                <tr>
                    <td>{{$atag->page}}</td>
                    <td>{{$atag->tag_type}}</td>
                    <td hidden=true>{{$atag->value}}</td>
                    <td hidden=true>{{$atag->sequence}}</td>
                    <td>
                        <a href="" target="_blank" class="btn btn-sm btn-success" hidden=true>Ver</a>

                        <a href="{{ route('atags.edit', ['atag' => $atag->id]) }}" class="btn btn-sm btn-info">Editar</a>
                        
                        <form class="d-inline" method="POST" action="{{ route('atags.destroy', ['atag' => $atag->id]) }}" onsubmit="return confirm('Tem certeza que deseja excluir?')">
                            @method('DELETE')
                            @csrf
                            <button class="btn btn-sm btn-danger">Excluir</button>
                        </form>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
</div>

{{ $atags->links() }}

@endsection