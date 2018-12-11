<sign-in-service>
    <div>
        <div each={item in viewItems()}
             class="service-item ghost-box-shadow">{item.label}</div>
    </div>

    <script>
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
