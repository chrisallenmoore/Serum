defmodule Serum.Payload do
  @moduledoc """
  This module contains string data used to initialize a new Serum project.
  """

  def template_base(), do: """
  <!doctype html>
  <html>
    <head>
      <meta charset="utf-8">
      <title><%= @site_name %> - <%= @page_title %></title>
    </head>
    <body>
      <h1><a href="<%= @base_url %>"><%= @site_name %></a></h1>
      <p><%= @site_description %></p>
      <%= @navigation %>
      <%= @contents %>
    </body>
  </html>
  """

  def template_nav(), do: """
  <ul>
    <%= for x <- @pages do %>
      <li>
        <a href="<%= @base_url %><%= x.name %>.html"><%= x.menu_text %></a>
      </li>
    <% end %>
    <li><a href="<%= @base_url %>posts/">Posts</a></li>
  </ul>
  """

  def template_list(), do: """
  <h2><%= @header %></h2>
  <ul>
    <%= for x <- @posts do %>
      <li>
        <a href="<%= x.url %>"><%= x.title %></a>
        &mdash;
        <span class="date"><%= x.date %></span>
      </li>
    <% end %>
  </ul>
  """

  def template_page(), do: """
  <%= @contents %>
  """

  def template_post(), do: """
  <h1><%= @title %></h1>
  <p>Posted on <%= @date %> by <%= @author %></p>
  <%= unless Enum.empty? @tags do %>
    <p>Tags:</p>
    <ul>
      <%= for t <- @tags do %>
        <li><a href=\"<%= t.list_url %>\"><%= t.name %></a></li>
      <% end %>
    </ul>
  <% end %>
  <%= @contents %>
  """
end
