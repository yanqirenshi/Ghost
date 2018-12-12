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
     this.items = [
         { label: 'Google',    ref: 'https://developers.google.com/identity/sign-in/web/',       description: '', display: true  , tag: 'sign-in-service-google' },
         { label: 'Facebook',  ref: '',                                                          description: '', display: false , tag: 'sign-in-service-facebook' },
         { label: 'Twitter',   ref: 'https://developer.twitter.com/',                            description: '', display: false , tag: 'sign-in-service-twitter' },
     ];
     this.items_wait = [
         { label: 'Yahoo',     ref: '',                                                          description: '', display: false , tag: '' },
         { label: 'LINE',      ref: '',                                                          description: '', display: false , tag: '' },
         { label: 'Github',    ref: 'https://developer.github.com/v3/',                          description: '', display: false , tag: '' },
         { label: 'Gitlab',    ref: 'https://docs.gitlab.com/ee/api/README.html',                description: '', display: false , tag: '' },
         { label: 'Bitbucket', ref: '',                                                          description: '', display: false , tag: '' },
         { label: 'Qiita',     ref: 'https://qiita.com/api/v2/docs#%E3%81%84%E3%81%84%E3%81%AD', description: '', display: false , tag: '' },
         { label: 'Redmine',   ref: 'http://www.redmine.org/projects/redmine/wiki/Rest_api',     description: '', display: false , tag: '' },
         { label: 'Slack',     ref: 'https://api.slack.com/',                                    description: '', display: false , tag: '' },
     ];
     this.viewItems = () => {
         return this.items.filter((d)=>{
             return d.display;
         });
     };
});

riot.tag2('sign-in-title', '<section class="section" style="padding-bottom: 0px; margin-top: 33px;"> <div class="container"> <h1 class="title is-1" riot-style="font-family:{fontFamily()}, cursive;">Ghost</h1> </div> </section>', 'sign-in-title > .section > .container > .title { text-align: center; font-size: 222px; text-shadow: 0px 0px 22px #333; }', '', function(opts) {
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
