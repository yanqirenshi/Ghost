riot.tag2('app', '<sign-in-title></sign-in-title> <sign-in-email></sign-in-email> <sign-in-service></sign-in-service>', '', '', function(opts) {
});

riot.tag2('sign-in-email', '<section class="section"> <div class="container"> <div class="card ghost-box-shadow"> <header class="card-header"> <p class="card-header-title"> Sign In </p> </header> <div class="card-content"> <form action="/ghost/api/v1/sign/in" method="post" enctype="application/json"> <input class="input" placeholder="Email" style="margin-bottom: 22px;" name="mail" type="email"> <input class="input" placeholder="Password" type="password" name="password"> <div style="margin-top:22px;"> <button class="button is-warning" style="width:100%;" onclick="{clickSignin}" type="submit">Sign In</button> </div> </form> </div> </div> </div> </section>', 'sign-in-email .card { width: 333px; margin-left: auto; margin-right: auto; border-radius: 8px 8px 0px 0px; }', '', function(opts) {
     this.clickSignin = () => {
     };

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

riot.tag2('sign-in-service-facebook', '', '', '', function(opts) {
});

riot.tag2('sign-in-service-google', '<div> <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div> </div>', '', '', function(opts) {
});

riot.tag2('sign-in-service-twitter', '', '', '', function(opts) {
});

riot.tag2('sign-in-service', '<div> <sign-in-service-google></sign-in-service-google> </div>', 'sign-in-service > div { display:flex; justify-content:center; margin-bottom:11px; } sign-in-service .service-item { width: 88px; height: 88px; border-radius: 44px; background: #eeeeee; margin-right: 11px; padding-top: 32px; text-align: center; } sign-in-service .service-item:hover { background: #ffec47; } sign-in-service .service-item:last-child { margin-right: 0px; }', '', function(opts) {
     this.viewItems = () => {
         return _GHOST_CONFIG.services.filter((d)=>{
             return d.display;
         });
     };
});

riot.tag2('sign-in-title', '<section class="section" style="padding-bottom: 0px; margin-top: 33px;"> <div class="container"> <h1 class="title is-1" riot-style="{title_style()}">{title()}</h1> </div> </section>', 'sign-in-title > .section > .container > .title { text-align: center; font-size: 222px; text-shadow: 0px 0px 22px #333; }', '', function(opts) {
     this.title_style = () => {
         let font = this.fontFamily();

         return 'font-family:'+ font.code + ', cursive;' +
                'font-size:' + font.size + ';'
     };

     this.fontFamily = () => {
         let fonts = _GHOST_CONFIG.title.fonts;
         let len = fonts.length;
         let i = Math.round( Math.random() * len );

         return fonts[i];
     };

     this.title = () => {
         console.log(_GHOST_CONFIG.title);
         let title = _GHOST_CONFIG.title.contents;
         return title ? title : '????????'
     }
});
