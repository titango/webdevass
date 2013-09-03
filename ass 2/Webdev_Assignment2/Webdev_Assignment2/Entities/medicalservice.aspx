﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="medicalservice.aspx.cs" Inherits="Webdev_Assignment2.Entities.medicalservice" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <link href="../Stylesheet/medicalservice.css" rel="stylesheet" />

    <div id="doctorfield">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="doctorsearchfield">
                    <asp:Label ID="Label1" class="LabelSite" runat="server" Text="MEDICAL SERVICE" Font-Bold="False"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="SearchButton" class="AllSearchButtons btn btn-default" runat="server" Text="Search" OnClick="SearchButton_Click" />

                    <asp:TextBox ID="SearchField" runat="server" class="AllSearchFields" placeholder="Search" Height="33px" Width="310px"></asp:TextBox>

                    <asp:AutoCompleteExtender ID="SearchField_AutoCompleteExtender" runat="server" TargetControlID="SearchField"
                        MinimumPrefixLength="1" CompletionInterval="10" ServiceMethod="GetCompletionList"
                        Enabled="true" CompletionSetCount="10" EnableCaching="true">
                    </asp:AutoCompleteExtender>

                </div>
                <asp:UpdateProgress ID="UpdateProgress1" class="AllUpdateProgresses" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="../Image/ajax-loader.gif" style="width: 147px; height: 18px" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:GridView ID="GridView1" class="AllGridViews" OnPreRender="GridView1_PreRender" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="Id" DataSourceID="LinqDataSource1" ForeColor="#1C5E55" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="800px" PageSize="15">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:HyperLinkField Text="View" ControlStyle-CssClass="btn btn-warning btn-xs" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="medicalservicedetails.aspx?id={0}" >
                        <ControlStyle CssClass="btn btn-warning btn-xs" />
                        </asp:HyperLinkField>

                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="ServiceName" HeaderText="ServiceName" SortExpression="ServiceName" >
                        <ControlStyle Width="130">
                            </ControlStyle>    
                        </asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" >
                            <ControlStyle Width="100">
                            </ControlStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="ServiceGroup" SortExpression="ServiceGroupId">
                            <EditItemTemplate>
                                <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ServiceGroupId") %>'></asp:TextBox>--%>

                                <asp:DropDownList ID="MedicalServiceGroupChange"
                                                  DataSourceID="LinqDataSource2"
                                                  DataValueField="Id"
                                                  DataTextField="ServiceGroup"
                                                  SelectedValue='<%# Bind("ServiceGroupId") %>'
                                                  runat="server"/>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("ServiceGroupId") %>'></asp:Label>--%>
                                <%# Eval("MedicalServiceGroup.ServiceGroup") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-warning btn-sm" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-default btn-sm" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary btn-sm" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-danger btn-sm" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" HorizontalAlign="Left" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                    <EditRowStyle CssClass="edit_rows_style" /> 
                </asp:GridView>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="Webdev_Assignment2.DataBaseServerDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="MedicalServices" OnSelecting="LinqDataSource1_Selecting">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="Webdev_Assignment2.DataBaseServerDataContext" EntityTypeName="" TableName="MedicalServiceGroups">
                </asp:LinqDataSource>
                <div id="SuccessBoxMessage" class="AlertBoxMessage alert alert-dismissable alert-success">
                    <strong>Inserted successfull !</strong>
                </div>

                <asp:Panel ID="panel_insert" runat="server" class="Newbox panel panel-success">
                    <asp:Panel ID="Panel1" runat="server" class="panel-heading" Style="z-index: 1;">
                        <h3 class="panel-title" style="float: left;">Create new doctor</h3>
                    </asp:Panel>
                    <div id="Insertplace" class="NewBoxBelow panel-body" style="display: block;">
                        <table class="table table-striped table-bordered table-hover">
                            <tr>
                                <td>
                                    <asp:Label ID="NameLabel" class="NewBoxTextLabel" runat="server" Text="Name:"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="NameTextBox" runat="server" Width="196px"></asp:TextBox>

                                    <asp:RegularExpressionValidator ID="NameValidation" runat="server" Display="Dynamic" ValidationGroup="InsertAllValidation"
                                        ForeColor="Red" Font-Bold="true" ErrorMessage="* Wrong name format" ControlToValidate="NameTextBox"
                                        ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="NameValidation2" ValidationGroup="InsertAllValidation"
                                        runat="server" ErrorMessage="* Name is required" Display="Dynamic"
                                        ControlToValidate="NameTextBox" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="PriceLabel" class="NewBoxTextLabel" runat="server" Text="Price:"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="PriceTextBox" runat="server" Width="196px"></asp:TextBox>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" ValidationGroup="InsertAllValidation"
                                        ForeColor="Red" Font-Bold="true" ErrorMessage="* Wrong price format ###,## (i.e. 23.45)" ControlToValidate="PriceTextBox"
                                        ValidationExpression="^[0-9]+.[0-9]{2}$"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="InsertAllValidation"
                                        runat="server" ErrorMessage="* Price is required" Display="Dynamic"
                                        ControlToValidate="PriceTextBox" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" class="NewBoxTextLabel" runat="server" Text="Medical Service Group:"></asp:Label></td>
                                <td>
                                    <asp:DropDownList ID="MedicalServiceGroupTextBox" runat="server" Width="106px">
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="GenderValidation" runat="server" ValidationGroup="InsertAllValidation"
                                        Font-Bold="true" ForeColor="Red" ControlToValidate="MedicalServiceGroupTextBox"
                                        ErrorMessage="*Medical Service Group is required"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <td>
                                        <asp:Button ID="InsertButton" ValidationGroup="InsertAllValidation" class="btn btn-success" runat="server" OnClick="InsertButton_Click" Text="Insert" Width="106px"></asp:Button></td>
                            </tr>
                        </table>

                    </div>
                </asp:Panel>
                <br />
                <br />

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
