<sign-in-service>
    <div>
        <sign-in-service-google></sign-in-service-google>
    </div>

    <script>
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
    </script>

    <style>
     sign-in-service > div {
         display:flex;
         justify-content:center;
         margin-bottom:11px;
     }

     sign-in-service .service-item {
         width: 88px;
         height: 88px;
         border-radius: 44px;
         background: #eeeeee;
         margin-right: 11px;

         padding-top: 32px;
         text-align: center;
     }
     sign-in-service .service-item:hover {
         background: #ffec47;
     }
     sign-in-service .service-item:last-child {
         margin-right: 0px;
     }
    </style>
</sign-in-service>
