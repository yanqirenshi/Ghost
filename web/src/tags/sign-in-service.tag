<sign-in-service>
    <div>
        <sign-in-service-google></sign-in-service-google>
    </div>

    <script>
     this.viewItems = () => {
         return _GHOST_CONFIG.services.filter((d)=>{
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
