<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Page;
use App\Atag;

class PageController extends Controller
{
    
    public function index($slug) {
        $page = Page::where('slug', $slug)->first();
        $atags = Atag::where('page', $page['id'])->orderBy('sequence', 'ASC')->paginate(20);
        
        $dados = new atag;
        $dados->urlPublica = $page['slug'];
        $dados->imagem = $page['photo'];
        $dados->capa = $page['cover'];
        $dados->sobre = $page['body'];
        $dados->nome = '';
        $dados->profissao = '';
        $dados->telefoneFixo = '';
        $dados->telefoneCelular = '';
        $dados->whatsapp = '';
        $dados->endereco = '';
        $dados->email = '';
        $dados->chavePix = '';
        $dados->linkFacebook = '';
        $dados->linkInstagram = '';
        $dados->linkTwitter = '';
        $dados->linkLinkedin = '';
        $dados->linkYoutube = '';
        $dados->linkTikTok = '';
        $dados->gtag = '';
        $dados->ftag = '';
        $dados->site = '';
        $dados->linkGithub = '';

        foreach($atags as $linha) {

            if($linha->tag_type == 'Nome')
                $dados->nome = $linha['value'];
                         
            if($linha->tag_type == 'Profissão')
                $dados->profissao = $linha['value'];
            
            if($linha->tag_type == 'Telefone')
                $dados->telefoneFixo = $linha['value'];
            
            if($linha->tag_type == 'Celular')
                $dados->telefoneCelular = $linha['value'];

            if($linha->tag_type == 'Whatsapp')
                $dados->whatsapp = $linha['value'];
            
            if($linha->tag_type == 'Endereço')
                $dados->endereco = $linha['value'];
            
            if($linha->tag_type == 'E-mail')
                $dados->email = $linha['value'];

            if($linha->tag_type == 'pix')
                $dados->chavePix = $linha['value'];
            
            if($linha->tag_type == 'Facebook')
                $dados->linkFacebook = $linha['value'];

            if($linha->tag_type == 'Instagram')
                $dados->linkInstagram = $linha['value'];

            if($linha->tag_type == 'Twitter')
                $dados->linkTwitter = $linha['value'];
            
            if($linha->tag_type == 'Linkedin')
                $dados->linkLinkedin = $linha['value'];

            if($linha->tag_type == 'Youtube')
                $dados->linkYoutube = $linha['value'];
            
            if($linha->tag_type == 'TikTok')
                $dados->linkTikTok = $linha['value']; 
                
            if($linha->tag_type == 'gtag')
                $dados->gtag = $linha['value'];
            
            if($linha->tag_type == 'ftag')
                $dados->ftag = $linha['value'];
            
            if($linha->tag_type == 'Site')
                $dados->site = $linha['value'];

            if($linha->tag_type == 'GitHub')
                $dados->linkGithub = $linha['value'];
        }
        
        if($page) {
            return view('site.page', [
                'page' => $page,
                'atags' => $atags,
                'dados' => $dados
            ]);
        } else {
            abort(404);
        }
    }
}
