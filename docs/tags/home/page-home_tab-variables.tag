<page-home_tab-variables>

    <section class="section">
        <div class="container">
            <h1 class="title">API</h1>
            <h2 class="subtitle"></h2>

            <div class="contents">
                <table class="table is-bordered is-striped is-narrow is-hoverable">
                    <thead>
                        <tr>
                            <th>File</th>
                            <th>Name</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr each={obj in api}>
                            <td>{obj.file}</td>
                            <td>{obj.name}</td>
                            <td>{obj.description}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <script>
     this.api = [
         { file: './graph/src/graph.lisp',            name: '*graphs*',                       description: '(make-hash-table)' },
         { file: './graph/src/graph.lisp',            name: '*graph-code-default*',           description: ':ghost' },
         { file: './graph/src/graph.lisp',            name: '*graph-stor-directories*',       description: '(make-hash-table)' },
         { file: './graph/src/graph.lisp',            name: '*graph-stor-base-directory*',    description: '' },
         { file: './api/src/route.lisp',              name: '*redirect-url-sign-in*',         description: 'nil' },
         { file: './api/src/route.lisp',              name: '*redirect-url-success-sign-in*', description: 'nil' },
         { file: './api/src/route.lisp',              name: '*route*',                        description: "(make-instance '<router>)" },
         { file: './api/src/controller/package.lisp', name: '*session-key-name*',             description: '' },
     ];
    </script>

</page-home_tab-variables>
