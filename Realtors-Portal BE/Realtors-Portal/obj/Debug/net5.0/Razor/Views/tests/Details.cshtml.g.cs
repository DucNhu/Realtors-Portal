#pragma checksum "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Details.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "5f8d5c44b2973a0cb5e4cb2bbab251f125c17e81"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_tests_Details), @"mvc.1.0.view", @"/Views/tests/Details.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"5f8d5c44b2973a0cb5e4cb2bbab251f125c17e81", @"/Views/tests/Details.cshtml")]
    public class Views_tests_Details : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Realtors_Portal.Models.test>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 3 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Details.cshtml"
  
    ViewData["Title"] = "Details";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<h1>Details</h1>\r\n\r\n<div>\r\n    <h4>test</h4>\r\n    <hr />\r\n    <dl class=\"row\">\r\n        <dt class = \"col-sm-2\">\r\n            ");
#nullable restore
#line 14 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Details.cshtml"
       Write(Html.DisplayNameFor(model => model.Name));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n        </dt>\r\n        <dd class = \"col-sm-10\">\r\n            ");
#nullable restore
#line 17 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Details.cshtml"
       Write(Html.DisplayFor(model => model.Name));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n        </dd>\r\n    </dl>\r\n</div>\r\n<div>\r\n    <a asp-action=\"Edit\"");
            BeginWriteAttribute("asp-route-id", " asp-route-id=\"", 416, "\"", 440, 1);
#nullable restore
#line 22 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Details.cshtml"
WriteAttributeValue("", 431, Model.id, 431, 9, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">Edit</a> |\r\n    <a asp-action=\"Index\">Back to List</a>\r\n</div>\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Realtors_Portal.Models.test> Html { get; private set; }
    }
}
#pragma warning restore 1591