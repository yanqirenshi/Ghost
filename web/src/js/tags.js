riot.tag2('app', '<sign-in-title></sign-in-title> <sign-in-email></sign-in-email> <sign-in-service></sign-in-service>', '', '', function(opts) {
});

riot.tag2('sign-in-email', '<section class="section" style="padding-top:0px;"> <div class="container"> <div class="card"> <div class="card-content"> <input class="input" type="text" placeholder="Email" style="margin-bottom: 22px;"> <input class="input" type="text" placeholder="Password"> <div style="margin-top:22px;"> <button class="button is-warning" style="width:100%;">Sign In</button> </div> </div> </div> </div> </section>', 'sign-in-email .card { width: 333px; margin-left: auto; margin-right: auto; }', '', function(opts) {
     this.fonts = [ 'Pacifico',
                    'Dancing Script',
                    'Shadows Into Light',
                    'Mountains of Christmas',
                    'Amatic SC',
                    'Kaushan Script',
                    'Satisfy',
                    'Great Vibes',
                    'Caveat',
                    'Sacramento',
                    'Bad Script',
                    'Rock Salt',
                    'Yellowtail',
                    'Cabin Sketch',
                    'Parisienne',
                    'Nothing You Could Do',
                    'Srisakdi',
                    'Allura',
                    'Reenie Beanie'];

     this.fontFamily = () => {
         let len = this.fonts.length;
         let i = Math.round( Math.random() * len );
         return this.fonts[i];
     };
});

riot.tag2('sign-in-service', '<div> <div class="service-item">Google</div> <div class="service-item">Facebook</div> <div class="service-item">Twitter</div> <div class="service-item">Yahoo</div> <div class="service-item">LINE</div> </div> <div> <div class="service-item">Github</div> <div class="service-item">Gitlab</div> <div class="service-item">Bitbucket</div> </div> <div> </div>', 'sign-in-service > div { display:flex; justify-content:center; margin-bottom:11px; } sign-in-service .service-item { width: 88px; height: 88px; border-radius: 44px; background: #eeeeee; margin-right: 11px; padding-top: 32px; text-align: center; } sign-in-service .service-item:last-child { margin-right: 0px; } sign-in-service .service-item:hover { background: #ffec47; }', '', function(opts) {
});

riot.tag2('sign-in-title', '<section class="section" style="padding-bottom: 0px;"> <div class="container"> <h1 class="title is-1" riot-style="font-family:{fontFamily()}, cursive;">Ghost</h1> </div> </section>', 'sign-in-title > .section > .container > .title { text-align: center; font-size: 222px; }', '', function(opts) {
     this.fonts = [ 'Pacifico',
                    'Dancing Script',
                    'Shadows Into Light',
                    'Mountains of Christmas',
                    'Amatic SC',
                    'Kaushan Script',
                    'Satisfy',
                    'Great Vibes',
                    'Caveat',
                    'Sacramento',
                    'Bad Script',
                    'Rock Salt',
                    'Yellowtail',
                    'Cabin Sketch',
                    'Parisienne',
                    'Nothing You Could Do',
                    'Srisakdi',
                    'Allura',
                    'Reenie Beanie'];

     this.fontFamily = () => {
         let len = this.fonts.length;
         let i = Math.round( Math.random() * len );
         return this.fonts[i];
     };
});
