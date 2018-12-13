<sign-in-email>
    <section class="section">
        <div class="container">
            <div class="card ghost-box-shadow">

                <header class="card-header">
                    <p class="card-header-title">
                        Sign In
                    </p>
                </header>

                <div class="card-content">
                    <form action={formAction()}
                          method="post"
                          enctype="application/json">
                        <input class="input"
                               placeholder="Email"
                               style="margin-bottom: 22px;"
                               type="email"
                               name="mail">

                        <input class="input"
                               placeholder="Password"
                               type="password"
                               name="password">

                        <div style="margin-top:22px;">
                            <button class="button is-warning"
                                    style="width:100%;"
                                    onclick={clickSignin}
                                    type="submit">Sign In</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <script>
     this.formAction = () => {
         return _GHOST_CONFIG.server.sign.in.in;
     };
    </script>

    <script>
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
    </script>

    <style>
     sign-in-email .card {
         width: 333px;
         margin-left: auto;
         margin-right: auto;
         border-radius: 8px 8px 0px 0px;
     }
    </style>
</sign-in-email>
