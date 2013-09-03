﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="drugdetails.aspx.cs" Inherits="Webdev_Assignment2.Entities.drugdetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Stylesheet/drug.css" rel="stylesheet" />
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

    <asp:FormView ID="DrugDetailsFormView" class="bs-example form-horizontal" runat="server"
        CellPadding="4" DataSourceID="LinqDataSource1" ForeColor="#333333" Width="999px" DataKeyNames="Id">
        <ItemTemplate>
            <asp:Label ID="Label5" class="LabelSite" runat="server" Text="DRUG DETAILS" Font-Bold="False"></asp:Label>
            <table id="tabledetails" class="table table-striped table-bordered table-hover">
                <tr>
                    <td class="details_info"><b>Id:</b></td>
                    <td class="details_info">
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Bind("Id") %>' /></td>
                </tr>

                <tr>
                    <td class="details_info"><b>Name:</b></td>
                    <td class="details_info">
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>' /></td>

                </tr>

                <tr>
                    <td class="details_info"><b>Generic Name:</b></td>
                    <td class="details_info">
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("GenericName") %>' /></td>

                </tr>

                <tr>
                    <td class="details_info"><b>Unit:</b></td>
                    <td class="details_info">
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Unit") %>' /></td>

                </tr>

                <tr>
                    <td class="details_info"><b>Price:</b></td>
                    <td class="details_info">
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Price") %>' /></td>

                </tr>

                <tr>
                    <td class="details_info"><b>Drug Group:</b></td>
                    <td class="details_info">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("DrugGroup.GroupName") %>' /></td>

                </tr>
            </table>
            <asp:Button ID="back_button" class="back_buttons btn btn-warning" runat="server" Text="Back" Width="106px" OnClick="back_button_Click"></asp:Button></td>
        </ItemTemplate>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:FormView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="Webdev_Assignment2.DataBaseServerDataContext" EntityTypeName="" TableName="Drugs" Where="Id == @Id1">
        <WhereParameters>
            <asp:QueryStringParameter Name="Id1" QueryStringField="Id" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
