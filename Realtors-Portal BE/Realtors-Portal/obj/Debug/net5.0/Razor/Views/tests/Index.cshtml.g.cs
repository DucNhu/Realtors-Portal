#pragma checksum "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "fa5d98bfee6b0fec3bbc71559ee170ebd619e606"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_tests_Index), @"mvc.1.0.view", @"/Views/tests/Index.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"fa5d98bfee6b0fec3bbc71559ee170ebd619e606", @"/Views/tests/Index.cshtml")]
    public class Views_tests_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IEnumerable<Realtors_Portal.Models.test>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 3 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Index.cshtml"
  
    ViewData["Title"] = "Index";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<h1>Index</h1>\r\n\r\n<p>\r\n    <a asp-action=\"Create\">Create New</a>\r\n</p>\r\n<table class=\"table\">\r\n    <thead>\r\n        <tr>\r\n            <th>\r\n                ");
#nullable restore
#line 16 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Index.cshtml"
           Write(Html.DisplayNameFor(model => model.Name));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th></th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n");
#nullable restore
#line 22 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Index.cshtml"
 foreach (var item in Model) {

#line default
#line hidden
#nullable disable
            WriteLiteral("        <tr>\r\n            <td>\r\n                ");
#nullable restore
#line 25 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Index.cshtml"
           Write(Html.DisplayFor(modelItem => item.Name));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </td>\r\n            <td>\r\n                <a asp-action=\"Edit\"");
            BeginWriteAttribute("asp-route-id", " asp-route-id=\"", 572, "\"", 595, 1);
#nullable restore
#line 28 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Index.cshtml"
WriteAttributeValue("", 587, item.id, 587, 8, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">Edit</a> |\r\n                <a asp-action=\"Details\"");
            BeginWriteAttribute("asp-route-id", " asp-route-id=\"", 648, "\"", 671, 1);
#nullable restore
#line 29 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Index.cshtml"
WriteAttributeValue("", 663, item.id, 663, 8, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">Details</a> |\r\n                <a asp-action=\"Delete\"");
            BeginWriteAttribute("asp-route-id", " asp-route-id=\"", 726, "\"", 749, 1);
#nullable restore
#line 30 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Index.cshtml"
WriteAttributeValue("", 741, item.id, 741, 8, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">Delete</a>\r\n            </td>\r\n        </tr>\r\n");
#nullable restore
#line 33 "C:\Users\Pc\Documents\GitHub\ProjectIII\Realtors-Portal\Realtors-Portal\Realtors-Portal\Views\tests\Index.cshtml"
}

#line default
#line hidden
#nullable disable
            WriteLiteral("    </tbody>\r\n</table>\r\n");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IEnumerable<Realtors_Portal.Models.test>> Html { get; private set; }
    }
}
#pragma warning restore 1591