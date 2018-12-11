<sign-in-service>
    <div>
        <div class="service-item">Google</div>
        <div class="service-item">Facebook</div>
        <div class="service-item">Twitter</div>
        <div class="service-item">Yahoo</div>
        <div class="service-item">LINE</div>
    </div>

    <div>
        <div class="service-item">Github</div>
        <div class="service-item">Gitlab</div>
        <div class="service-item">Bitbucket</div>
    </div>

    <div>
    </div>

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
     sign-in-service .service-item:last-child {
         margin-right: 0px;
     }
     sign-in-service .service-item:hover {
         background: #ffec47;
     }
    </style>
</sign-in-service>
