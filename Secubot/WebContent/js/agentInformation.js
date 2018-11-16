function TabPanel(selector) {
	this.$tabPanel = null;
	this.$tabMenu = null;
	this.$tabMenuItems = null;
	this.$selectTabMenuItem = null;
	
	this.$tabContents = null;
	this.$selectTabContent = null;
	
	this.init(selector);
	this.initEvent();
	this.initTabContents();
	this.setSelectTabMenuItemAt(0);
}

TabPanel.prototype.init = function(selector) {
	this.$tabPanel = $(selector);
	this.$tabMenu = this.$tabPanel.children(".tab-menu");
	this.$tabMenuItems = this.$tabMenu.children("li");
	this.$tabContents = this.$tabPanel.find(".tab-contents .content");
}

TabPanel.prototype.initEvent = function() {
	var objThis = this;
	this.$tabMenuItems.on("click", function(e) {
		e.preventDefault();
		objThis.setSelectTabMenuItem($(this));
	})
}

TabPanel.prototype.initTabContents = function() {
	this.$tabContents.css({
		opacity: 0
	})
}

TabPanel.prototype.setSelectTabMenuItem = function($item) {
	if (this.$selectTabMenuItem) {
		this.$selectTabMenuItem.removeClass("select");
	}
	
	this.$selectTabMenuItem = $item;
	this.$selectTabMenuItem.addClass("select");
	
	var newIndex = this.$tabMenuItems.index(this.$selectTabMenuItem);
	this.showContentAt(newIndex);
}

TabPanel.prototype.setSelectTabMenuItemAt = function(index) {
	this.setSelectTabMenuItem(this.$tabMenuItems.eq(index));
}

TabPanel.prototype.showContentAt = function(index) {
	var $hideContent = this.$selectTabContent;
	var $showContent = this.$tabContents.eq(index);
	
	if ($hideContent) {
		$hideContent.css({opacity: 0})
	}
	
	$showContent.css({opacity: 1});
	
	this.$selectTabContent = $showContent;
}

