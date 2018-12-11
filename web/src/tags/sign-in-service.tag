<sign-in-service>
    <div>
        <div each={item in viewItems()}
             class="service-item ghost-box-shadow">{item.label}</div>
    </div>

    <script>
     this.items = [
         { label: 'Google',    ref: 'https://developers.google.com/identity/sign-in/web/',       description: '', display: true  },
         { label: 'Facebook',  ref: '',                                                          description: '', display: false },
         { label: 'Twitter',   ref: 'https://developer.twitter.com/',                            description: '', display: false },
         { label: 'Yahoo',     ref: '',                                                          description: '', display: false },
         { label: 'LINE',      ref: '',                                                          description: '', display: false },
         { label: 'Github',    ref: 'https://developer.github.com/v3/',                          description: '', display: false },
         { label: 'Gitlab',    ref: 'https://docs.gitlab.com/ee/api/README.html',                description: '', display: false },
         { label: 'Bitbucket', ref: '',                                                          description: '', display: false },
         { label: 'Qiita',     ref: 'https://qiita.com/api/v2/docs#%E3%81%84%E3%81%84%E3%81%AD', description: '', display: false },
         { label: 'Redmine',   ref: 'http://www.redmine.org/projects/redmine/wiki/Rest_api',     description: '', display: false },
         { label: 'Slack',     ref: 'https://api.slack.com/',                                    description: '', display: false },
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
