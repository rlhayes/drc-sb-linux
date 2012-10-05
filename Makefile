.PHONY: FORCE_DO_CMD
FORCE_DO_CMD:


TOOLSET := target
TARGET := cefclient
### Generated for copy rule.
$(builddir)/files/binding.html: TOOLSET := $(TOOLSET)
$(builddir)/files/binding.html: ./cefclient/res/binding.html FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/files/binding.html
$(builddir)/files/domaccess.html: TOOLSET := $(TOOLSET)
$(builddir)/files/domaccess.html: ./cefclient/res/domaccess.html FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/files/domaccess.html
$(builddir)/files/localstorage.html: TOOLSET := $(TOOLSET)
$(builddir)/files/localstorage.html: ./cefclient/res/localstorage.html FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/files/localstorage.html
$(builddir)/files/logo.png: TOOLSET := $(TOOLSET)
$(builddir)/files/logo.png: ./cefclient/res/logo.png FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/files/logo.png
$(builddir)/files/xmlhttprequest.html: TOOLSET := $(TOOLSET)
$(builddir)/files/xmlhttprequest.html: ./cefclient/res/xmlhttprequest.html FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/files/xmlhttprequest.html
cefclient_copies = $(builddir)/files/binding.html $(builddir)/files/domaccess.html $(builddir)/files/localstorage.html $(builddir)/files/logo.png $(builddir)/files/xmlhttprequest.html

DEFS_Default := '-DUSING_CEF_SHARED'

# Flags passed to all source files.
CFLAGS_Default := 

# Flags passed to only C files.
CFLAGS_C_Default := 

# Flags passed to only C++ files.
CFLAGS_CC_Default := 

INCS_Default := -I..

OBJS := $(obj).target/$(TARGET)/./cefclient/cefclient.o \
	$(obj).target/$(TARGET)/./cefclient/binding_test.o \
	$(obj).target/$(TARGET)/./cefclient/client_app.o \
	$(obj).target/$(TARGET)/./cefclient/client_app_delegates.o \
	$(obj).target/$(TARGET)/./cefclient/client_handler.o \
	$(obj).target/$(TARGET)/./cefclient/client_renderer.o \
	$(obj).target/$(TARGET)/./cefclient/client_switches.o \
	$(obj).target/$(TARGET)/./cefclient/dom_test.o \
	$(obj).target/$(TARGET)/./cefclient/scheme_test.o \
	$(obj).target/$(TARGET)/./cefclient/string_util.o \
	$(obj).target/$(TARGET)/./cefclient/cefclient_gtk.o \
	$(obj).target/$(TARGET)/./cefclient/client_handler_gtk.o \
	$(obj).target/$(TARGET)/./cefclient/resource_util_linux.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/../libcef_dll_wrapper.a

# Make sure our actions/rules run before any of us.
$(OBJS): | $(cefclient_copies)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE)) $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE)) $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
# Build our special outputs first.
$(builddir)/cefclient: | $(cefclient_copies)

# Preserve order dependency of special output on deps.
$(cefclient_copies): | $(obj).target/../libcef_dll_wrapper.a

LDFLAGS_Default := 

LIBS := 

$(builddir)/cefclient: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(builddir)/cefclient: LIBS := $(LIBS)
$(builddir)/cefclient: LD_INPUTS := $(OBJS) $(obj).target/../libcef_dll_wrapper.a
$(builddir)/cefclient: TOOLSET := $(TOOLSET)
$(builddir)/cefclient: $(OBJS) $(obj).target/../libcef_dll_wrapper.a FORCE_DO_CMD
	$(call do_cmd,link)

all_deps += $(builddir)/cefclient
# Add target alias
.PHONY: cefclient
cefclient: $(builddir)/cefclient

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/cefclient

