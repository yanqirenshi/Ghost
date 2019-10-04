<page-home>

    <section-header title="HOME"></section-header>

    <div style="padding-left:55px;">
        <page-tabs core={page_tabs} callback={clickTab}></page-tabs>
    </div>

    <div>
        <page-home_tab-readme    class="hide"></page-home_tab-readme>
        <page-home_tab-packages  class="hide"></page-home_tab-packages>
        <page-home_tab-variables class="hide"></page-home_tab-variables>
        <page-home_tab-classes   class="hide"></page-home_tab-classes>
        <page-home_tab-api       class="hide"></page-home_tab-api>
    </div>

    <script>
     this.page_tabs = new PageTabs([
         {code: 'readme',    label: 'Readme',    tag: 'page-home_tab-readme' },
         {code: 'packages',  label: 'Packages',  tag: 'page-home_tab-packages' },
         {code: 'variables', label: 'Variables', tag: 'page-home_tab-variables' },
         {code: 'classes',   label: 'Classes',   tag: 'page-home_tab-classes' },
         {code: 'api',       label: 'API',       tag: 'page-home_tab-api' },
     ]);

     this.on('mount', () => {
         this.page_tabs.switchTab(this.tags)
         this.update();
     });

     this.clickTab = (e, action, data) => {
         if (this.page_tabs.switchTab(this.tags, data.code))
             this.update();
     };
    </script>

</page-home>
