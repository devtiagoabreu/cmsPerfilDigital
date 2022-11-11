@section('title', $page['title'])
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href=".">
    <title>{{$page['title']}}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#202020">
    <meta property="og:site_name" content="atriostech">
    <meta property="og:title" content="Tiago de Abreu - Developer">
    <meta property="og:description" content="{{$page['body']}}">
    <meta property="og:url" content="hhttp://atriostech.com.br/perfilDigital">
    <meta property="og:type" content="website">
    <meta property="og:image" itemprop="image" content="https://dvisit-storage.s3.sa-east-1.amazonaws.com/perfil/7285b46c-bd4b-4a1b-a219-5bda9fd3b18f/1e3a5c79073e45f46aa5ca38703e37e7.png">
    <meta property="og:image:secure_url" itemprop="image" content="https://dvisit-storage.s3.sa-east-1.amazonaws.com/perfil/7285b46c-bd4b-4a1b-a219-5bda9fd3b18f/1e3a5c79073e45f46aa5ca38703e37e7.png">
    <link rel="shortcut icon" type="image/x-icon" href="./index_files/favicon.ico">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="{{asset('assets/css/style_.css')}}">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/englishextra/qrjs2@latest/js/qrjs2.min.js"></script>
    <script src="{{asset('assets/js/qrjs2.min.js.download')}}"></script>
    <script src="{{asset('assets/js/sweetalert2.min.js.download')}}"></script>
    <script src="{{asset('assets/js/script.js.download')}}"></script>
    <script> 
        var data = <?= json_encode($dados); ?>
    </script>
    <style>
        .card .banner {
            background-image: url("{{asset('assets/img/pages')}}/{{$page['cover']}}");
        }
    </style>
</head>
<body translate="no">
    <div class="card">
        <div class="banner" id="banner">
            <img id="foto" src="assets/img/pages/{{$page['photo']}}">
        </div>
        <h2 class="name">{{$page['title']}}</h2>
        <div class="title">{{$dados->profissao}}</div>
        <div class="desc">
            {{$page['body']}}
        </div>
        <div class="social">
            <div class="item-social noselect save-vcard" onclick="qrcode()">
                <i class="far fa-qrcode"></i> <br>
                Modo Offline
            </div>
            <div>
                <a rel="nofollow" href="javascript:void(0)" class="bt-vcard noselect" onclick="saveVCard()">
                    <span>Salvar na Agenda</span>
                </a>
            </div>
            <div class="item-social noselect" onclick="share()">
                <i class="far fa-share"></i> <br>
                <span>Compartilhar</span>
            </div>
        </div>
        <div class="qrcode-container"
            style="display: none;text-align: center;border:1px solid #e5e5e5;margin:20px;border-radius:10px;padding:20px;border:2px solid #000000;">
            <b>Modo Offline</b>
            <p>Acesse com a câmera do celular para salvar o contato na agenda.</p>
            <div style="text-align: center;display: flex;flex-direction:colum;padding: 0px;">
                <div id="qrcode" class="qr-code-generetor" style="margin:auto;border:12px solid #fff"></div><br>
            </div>
        </div>
        <div class="actions">
            <div class="follow-info">
                <h2><a href="javascript:void(0)" onclick="callPhone(event)" id="telefone"><span><i
                                class="fa fa-phone"></i></span><small>Ligar</small></a></h2>
                <h2>
                    <a href="https://api.whatsapp.com/send?phone=55{{$dados->whatsapp}}" target="_blank">
                        <span>
                            <i class="fab fa-whatsapp"></i>
                        </span>
                        <small>Whatsapp</small>
                    </a>
                </h2>
                <h2>
                    <a href="mailto:{{$dados->email}}">
                        <span>
                            <i class="fa fa-envelope"></i>
                        </span>
                        <small>Email</small>
                    </a>
                </h2>
                <h2>
                    <a href="javascript:void(0);" onclick="showAddress(event)" id="endereco">
                        <span>
                            <i class="fa fa-map"></i>
                        </span>
                        <small>Endereço</small>
                    </a>
                </h2>
            </div>
        </div>
        <div class="links">
            <div class="links-container" id="links-container">
                <a href="javascript:void(0)" class="link-profile noselect" onclick="callPix(event)">
                    <i class="fa fa-key pr-10"></i>
                    <span class="pr-10">Chave Pix</span>
                    <span id="pix"></span>
                </a>
                <a target="_blank" href="{{$dados->linkGithub}}" class="link-profile noselect">
                    <i class="fab fa-github pr-10"></i>
                    <span>GitHub </span>
                </a>
                <a target="_blank" href="{{$dados->linkLinkedin}}" class="link-profile noselect">
                    <i class="fab fa-linkedin pr-10"></i>
                    <span>LinkeIn </span>
                </a>
                <a target="_blank" href="{{$dados->linkFacebook}}" class="link-profile noselect">
                    <i class="fab fa-facebook pr-10"></i>
                    <span>Facebook </span>
                </a>
                <a target="_blank" href="{{$dados->linkInstagram}}" class="link-profile noselect">
                    <i class="fab fa-instagram pr-10"></i>
                    <span>Instagram </span>
                </a>
                <a target="_blank" href="{{$dados->linkTwitter}}" class="link-profile noselect">
                    <i class="fab fa-twitter pr-10"></i>
                    <span>Twitter </span>
                </a>
                <a target="_blank" href="{{$dados->linkYoutube}}" class="link-profile noselect">
                    <i class="fab fa-youtube pr-10"></i>
                    <span>Youtube </span>
                </a>
                <a target="_blank" href="{{$dados->site}}" class="link-profile noselect">
                    <i class="fa fa-globe pr-10"></i>
                    <span>Site</span>
                </a>
            </div>
        </div>
    </div>
    <div class="rodape">
        <a target="_blank" class="link-profile noselect" style="color:#000; background-color: #fffc5d; font-weight: bold;"
            href="http://atagconnect.com.br/loja">EU QUERO COMPRAR UM PERFIL DIGITAL</a>
        <br><br>
        <a target="_blank" href="http://atagconnect.com.br">
            <img src="{{asset('assets/img/logo_atag.png')}}" height="20">
        </a>
    </div>
    <script async="" src="./index_files/js(1)"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'G-QJK0XZL0V8');
        gtag('config', 'UA-200844360-1');
    </script>
    <script>
        ! function (f, b, e, v, n, t, s) {
            if (f.fbq) return;
            n = f.fbq = function () {
                n.callMethod ?
                    n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            };
            if (!f._fbq) f._fbq = n;
            n.push = n;
            n.loaded = !0;
            n.version = '2.0';
            n.queue = [];
            t = b.createElement(e);
            t.async = !0;
            t.src = v;
            s = b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t, s)
        }(window, document, 'script',
            'https://connect.facebook.net/en_US/fbevents.js');

        fbq('init', '740488063887424');
        fbq('track', 'PageView');
    </script>
    <noscript>
        <img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=740488063887424&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>















