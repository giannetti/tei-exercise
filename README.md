# TEI Exercise

A quick and dirty text encoding exercise for the literature classroom that uses the Firefox XSLT processor to generate an HTML preview.

Needed: 

1. Firefox browser: <https://www.mozilla.org/en-US/firefox/new/>
2. Visual Studio Code text editor: <https://code.visualstudio.com/download>
3. The Scholarly XML extension in Visual Studio Code: <https://marketplace.visualstudio.com/items?itemName=raffazizzi.sxml>

The use case for this exercise is fairly narrow. The laptops in the computer classroom available to me were so slow as to be unusable (old, cheap, and tiny drives with storage totally maxed out). So that meant that the Oxygen XML Editor would not function, even with the one-month trial license that they are usually kind enough to offer for classroom purposes. My back-up plan was to use Firefox's built-in XSLT processor and ask the students to download both Firefox and VS Code. To my mind, this was the most light-weight solution that wouldn't take too much disk space on the students' personal computers, and wouldn't create too much of a software installation burden. These files are set up to work in such a way that when the student opens `template.xml` in Firefox, the XSL transformation is triggered and HTML opens in the browser. 

# CORS Fix

With the current version of Firefox (100.0.2 or later), this additional tweak is necessary to allow students to open local files without getting a cross-origin error that prevents the HTML from loading (note: this should only matter if your TEI file contains references or anything that you are seeking to render as an anchor tag in HTML). Note that the restriction on cross-origin links in local HTML files is a common sense security fix. This setting should probably be reversed at the conclusion of the exercise. More info: <https://www.mozilla.org/en-US/security/advisories/mfsa2019-21/#CVE-2019-11730>.

1. In a new Firefox tab, type or paste `about:config` in the address bar and press Enter/Return. Click the button promising to be careful or accepting the risk.
2. In the search box above the list, type or paste `fileuri` and pause while the list is filtered
3. Double-click the `security.fileuri.strict_origin_policy` preference to switch the value from true to false. 
