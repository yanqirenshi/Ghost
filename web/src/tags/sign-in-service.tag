<sign-in-service>
    <div>
        <div each={item in viewItems()}
             class="service-item ghost-box-shadow">{item.label}</div>
    </div>

    <script>
     this.items = [
         { label: 'Google' },
         { label: 'Facebook' },
         { label: 'Twitter' },
         { label: 'Yahoo' },
         { label: 'LINE' },
         { label: 'Github' },
         { label: 'Gitlab' },
         { label: 'Bitbucket' },
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
