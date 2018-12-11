riot.tag2('app', '<sign-in-title></sign-in-title> <sign-in-email></sign-in-email> <sign-in-service></sign-in-service>', '', '', function(opts) {
});

riot.tag2('sign-in-email', '<section class="section" style="padding-top:11px;"> <div class="container"> <div class="card ghost-box-shadow"> <header class="card-header"> <p class="card-header-title"> Sign In </p> </header> <div class="card-content"> <input class="input" type="text" placeholder="Email" style="margin-bottom: 22px;"> <input class="input" type="text" placeholder="Password"> <div style="margin-top:22px;"> <button class="button is-warning" style="width:100%;">Sign In</button> </div> </div> </div> </div> </section>', 'sign-in-email .card { width: 333px; margin-left: auto; margin-right: auto; border-radius: 8px 8px 0px 0px; }', '', function(opts) {
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

riot.tag2('sign-in-service', '<div> <div each="{item in viewItems()}" class="service-item ghost-box-shadow">{item.label}</div> </div>', 'sign-in-service > div { display:flex; justify-content:center; margin-bottom:11px; } sign-in-service .service-item { width: 88px; height: 88px; border-radius: 44px; background: #eeeeee; margin-right: 11px; padding-top: 32px; text-align: center; } sign-in-service .service-item:hover { background: #ffec47; } sign-in-service .service-item:last-child { margin-right: 0px; }', '', function(opts) {
     this.items = [
         { label: 'Google',    ref: 'https://developers.google.com/identity/sign-in/web/',       description: '' },
         { label: 'Facebook',  ref: '',                                                          description: '' },
         { label: 'Twitter',   ref: 'https://developer.twitter.com/',                            description: '' },
         { label: 'Yahoo',     ref: '',                                                          description: '' },
         { label: 'LINE',      ref: '',                                                          description: '' },
         { label: 'Github',    ref: 'https://developer.github.com/v3/',                          description: '' },
         { label: 'Gitlab',    ref: 'https://docs.gitlab.com/ee/api/README.html',                description: '' },
         { label: 'Bitbucket', ref: '',                                                          description: '' },
         { label: 'Qiita',     ref: 'https://qiita.com/api/v2/docs#%E3%81%84%E3%81%84%E3%81%AD', description: '' },
         { label: 'Redmine',   ref: 'http://www.redmine.org/projects/redmine/wiki/Rest_api',     description: '' },
         { label: 'Slack',     ref: 'https://api.slack.com/',                                    description: '' },
     ];
     this.viewItems = () => {
         return this.items;
     };
});

riot.tag2('sign-in-title', '<section class="section" style="padding-bottom: 0px;"> <div class="container"> <h1 class="title is-1" riot-style="font-family:{fontFamily()}, cursive;">Ghost</h1> </div> </section>', 'sign-in-title > .section > .container > .title { text-align: center; font-size: 222px; text-shadow: 0px 0px 22px #333; }', '', function(opts) {
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
