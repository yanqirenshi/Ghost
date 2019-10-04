<page-home_tab-api>

    <section class="section">
        <div class="container">
            <h1 class="title">API</h1>
            <h2 class="subtitle"></h2>

            <div class="contents">
                <table class="table is-bordered is-striped is-narrow is-hoverable">
                    <thead>
                        <tr>
                            <th>Method</th>
                            <th>Path</th>
                            <th>Description</th>
                            <th>実装</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr each={obj in api}>
                            <td>{obj.method}</td>
                            <td>{obj.path}</td>
                            <td>{obj.description}</td>
                            <td>{obj.implementation}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <script>
     this.api = [
         { method: 'POST', path: '/sign/in',                 description: '', implementation: true },
         { method: 'POST', path: '/sign/out',                description: '', implementation: true },
         { method: 'POST', path: '/sign/up',                 description: '', implementation: false },
         { method: 'GET',  path: '/session/check',          description: '', implementation: true },
         { method: 'GET',  path: '/ghosts/:id',             description: '', implementation: true },
         { method: 'GET',  path: '/list/ghosts/with/email', description: '', implementation: true },
         { method: 'POST', path: '/emails/password',         description: '', implementation: true },
         { method: 'POST', path: '/ghosts/emails',           description: '', implementation: true },
     ];
    </script>

</page-home_tab-api>
