<header class="header" role="banner">
	<div class="inner">
		<div class="unit size4of4 lastUnit">
			<a href="$BaseHref" class="brand" rel="home">
				<h1>$SiteConfig.Title</h1>
				<p>Theme = app</p>
			</a>
			<% if $SearchForm %>
				<span class="search-dropdown-icon">L</span>
				<div class="search-bar">
					$SearchForm
				</div>
			<% end_if %>
			<% include Navigation %>
		</div>
	</div>
</header>