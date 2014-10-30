tools = git /usr/local/bin/vim tmux reptyr openbox perf go

src_dir = $(HOME)/code
vim = $(src_dir)/vim
git = $(src_dir)/git
git-manpages = $(src_dir)/git-manpages
tmux = $(src_dir)/tmux
reptyr = $(src_dir)/reptyr
tig = $(src_dir)/tig
go = $(HOME)/go
linux = $(src_dir)/linux
openbox = $(src_dir)/openbox

repo_vim = https://vim.googlecode.com/hg/
repo_git = git://git.kernel.org/pub/scm/git/git.git
repo_git_manpages = git://git.kernel.org/pub/scm/git/git-manpages.git
repo_tmux = git://git.code.sf.net/p/tmux/tmux-code
repo_reptyr = git://github.com/nelhage/reptyr.git
repo_tig = git://github.com/jonas/tig.git
repo_go = https://code.google.com/p/go
repo_linux = git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
repo_openbox = git://github.com/danakj/openbox.git


often = updatevim updategit updatetmux updateopenbox updatereptyr
all:    $(often)

# Update
.PHONY: $(updatevim updategit updatetmux updatego updateperf)
updatevim: $(vim)
	cd $(vim) && hg pull -u && \
	sh $(CURDIR)/vim.sh

updategit: $(git) $(git-manpages)
	cd $(git-manpages) && git pull --rebase && \
	cd $(git) && git pull --rebase && \
	sh $(CURDIR)/git.sh

updatereptyr: $(reptyr)
	cd $(reptyr) && git pull --rebase && \
	sh $(CURDIR)/reptyr.sh
updatetmux: $(tmux)
	cd $(tmux) && git pull --rebase && \
	sh $(CURDIR)/tmux.sh

updatetig: $(tig)
	cd $(tig) && git pull --rebase && \
	sh $(CURDIR)/tig.sh

updatego: $(go)
	cd $(go) && hg pull -u && \
	sh $(CURDIR)/go.sh

updateperf: $(linux)
	cd $(linux)/tools/perf && git pull && \
	sh $(CURDIR)/perf.sh

updateopenbox: $(openbox)
	cd $(openbox) && git pull && \
	sh $(CURDIR)/openbox.sh

$(src_dir):
	echo mkdir $(src_dir)

# Clone
$(vim):
	@echo [CLONE] vim; hg clone $(repo_vim) $@

$(git):
	@echo [CLONE] git; git clone $(repo_git) $@

$(reptyr):
	@echo [CLONE] reptyr; git clone $(repo_reptyr) $@

$(tmux):
	@echo [CLONE] tmux; git clone $(repo_tmux) $@

$(tig):
	@echo [CLONE] tig; git clone $(repo_tig) $@

$(go):
	@echo [CLONE] go; hg clone $(repo_go) $@

$(linux):
	@echo [CLONE] linux; git clone $(repo_linux) $@

$(openbox):
	@echo [CLONE] openbox; git clone $(repo_openbox) $@

$(git-manpages):
	echo [CLONE] git-manpages; git clone $(repo_git_manpages) $@

ages:
	@which age >/dev/null || { echo Need age - github.com/holygeek/age.git; exit 0; }
	@for tool in $(tools); do \
		p=`which $$tool`; \
		[ -n "$$p" ] && age -c $$p; \
	done | while read line; do \
		printf "%30s %4s %2s %2s %2s %2s %2s %2s %2s %2s %2s %2s %2s\n" `eval echo $$line`; \
	done
