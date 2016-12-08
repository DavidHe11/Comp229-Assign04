<%@ Page Title="Model List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModelList.aspx.cs" Inherits="Comp229_Assign04._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-xs-12 col-md-4 Title">
        <asp:Label ID="title" runat="server"></asp:Label>
    </div>
    <div class="col-xs-12 col-md-4">
            <table>
             <tr>
                 <td>Name:</td>
                 <td>Faction:</td>
             </tr>
                </table>
    <asp:Repeater runat="server" ID="modelListRepeater">
        <ItemTemplate>
            <table>
            <tr>
                <td>
            <asp:hyperlink runat="server" NavigateUrl='<%#string.Format("~/ModelView.aspx?name={0}&faction={1}", Eval("name"), Eval("faction"))%>' Text='<%# Eval("name") %>'/>
                </td>
                <td>
            <asp:Label runat="server" Text='<%#Eval("faction") %>'></asp:Label>
                </td>
            </tr>
            </table>
        </ItemTemplate>
    </asp:Repeater>
        <div class="col-xs-12 col-md-4">
            Send us a update of the file for yourself:
            From:<asp:TextBox runat="server" ID="From Mail address"></asp:TextBox>
            <asp:Button runat="server" ID="sendMailButton" />
        </div>
    </div>
</asp:Content>
