@extends('adminlte::page')

@section('title', 'Links')

@section('content_header')
    <h1>
        Meus Links
        <a href="{{ route('publicLinks.create') }}" class="btn btn-sm btn-success">Novo Link</a>
    </h1>
@endsection

@section('content')

<div class="card">
    <div class="card-body">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th width="50" hidden="true">ID</th>
                    <th>Descrição</th>
                    <th>url</th>
                    <th>Sequência</th>
                    <th width="200">Ações</th>
                </tr>
            </thead>
            <tbody>
            @foreach($publicLinks as $publicLink)
                <tr>
                    <td hidden="true">{{$publicLink->id}}</td>
                    <td>{{$publicLink->description}}</td>
                    <td>{{$publicLink->url}}</td>
                    <td>{{$publicLink->sequence}}</td>
                    <td>
                        <a href="" target="_blank" class="btn btn-sm btn-success">Ver</a>

                        <a href="{{ route('publicLinks.edit', ['publicLink' => $publicLink->id]) }}" class="btn btn-sm btn-info">Editar</a>
                        
                        <form class="d-inline" method="POST" action="{{ route('publicLinks.destroy', ['publicLink' => $publicLink->id]) }}" onsubmit="return confirm('Tem certeza que deseja excluir?')">
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

{{ $publicLinks->links() }}

@endsection