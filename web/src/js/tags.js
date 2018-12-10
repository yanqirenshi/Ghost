riot.tag2('app', '<sign-in-email></sign-in-email> <sign-in-service></sign-in-service>', '', '', function(opts) {
});

riot.tag2('sign-in-email', '<section class="section"> <div class="container"> <h1 class="title is-1" style="text-align: center; font-size:222px;">Ghost</h1> <div class="card"> <div class="card-content"> <input class="input" type="text" placeholder="Email" style="margin-bottom: 22px;"> <input class="input" type="text" placeholder="Password"> <div style="margin-top:22px;"> <button class="button is-warning" style="width:100%;">Sign In</button> </div> </div> </div> </div> </section>', 'sign-in-email .card { width: 333px; margin-left: auto; margin-right: auto; }', '', function(opts) {
});

riot.tag2('sign-in-service', '<div style="display:flex; justify-content:center;"> <div class="service-item">Google</div> <div class="service-item">Facebook</div> <div class="service-item">Github</div> <div class="service-item">Gitlab</div> <div class="service-item">Twitter</div> </div>', 'sign-in-service .service-item { width: 88px; height: 88px; border-radius: 44px; background: #eeeeee; margin-right: 11px; padding-top: 32px; text-align: center; } sign-in-service .service-item:last-child { margin-right: 0px; }', '', function(opts) {
});
