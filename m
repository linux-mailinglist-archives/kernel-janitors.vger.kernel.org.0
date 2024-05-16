Return-Path: <kernel-janitors+bounces-3156-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ED28C7EFA
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 May 2024 01:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8891328393C
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 May 2024 23:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCA02C848;
	Thu, 16 May 2024 23:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vJePmK01";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="PpiwqvT+";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vJePmK01";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="PpiwqvT+"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CBF273FC;
	Thu, 16 May 2024 23:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715902350; cv=none; b=Znq6t2WTdrRJVKQ764gCE9cf7gNmztDK9EuXJtL9H5Q6ibARzkmiGBZK0jgt4u/nv6J6b+66WbbUjcVXhV7v52FkEEPBX5fka62BQEp7/LqlEsCkc9DT5YYVQawcyjFgM/EUP8vNWH/z3heeQp1ZNeLhWfYlpZ14tvfh99ETHZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715902350; c=relaxed/simple;
	bh=XPvN/x0YM7FjM+DUOY9PFaKFtZgFRwnoAckAbureDCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3e0V6Fmj8+nPWUlSCjYYSJrPLBHZ0x2CBTInBKroUSZKqCIZiy4bkr0Pnv4qNt77lITpBWl4vpU3qc2qyhWFRlm+wRnTLDDF7vbynupv/ultIiDvMAZ9AkMxbPVpyVfAuKJtXwqgLW73bnzfBlkCpzFDRd3+zS7vj9vm3pLtRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vJePmK01; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=PpiwqvT+; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vJePmK01; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=PpiwqvT+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 865CD35172;
	Thu, 16 May 2024 23:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1715902345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GKp+kBPnFAkOZUY2XXPskauDFmieuBfEsmE+HXmtfXw=;
	b=vJePmK01aa6qql45x/4CrwwvI3q1XIyolg8cR5TJZSusDUYW7jK4TDHmtKdFRdOMPngqlc
	6pJJ8EOwIGY73/ynrpA1tlJut5EmKYXDpTPn1Zur6i7oEDGNVzWWphHKSV9zXrC65XZ3UI
	MAvZSh5UUJvtRictRlCRfkSqW3GJMl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1715902345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GKp+kBPnFAkOZUY2XXPskauDFmieuBfEsmE+HXmtfXw=;
	b=PpiwqvT+Hj8Q0ndEx/n5eV/aAsfRYvtyRe/iqcFEAhDAZC8Pa+59JzCP2SBqQFL87ki3Ye
	rMLyZNCyPoCBrHBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=vJePmK01;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=PpiwqvT+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1715902345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GKp+kBPnFAkOZUY2XXPskauDFmieuBfEsmE+HXmtfXw=;
	b=vJePmK01aa6qql45x/4CrwwvI3q1XIyolg8cR5TJZSusDUYW7jK4TDHmtKdFRdOMPngqlc
	6pJJ8EOwIGY73/ynrpA1tlJut5EmKYXDpTPn1Zur6i7oEDGNVzWWphHKSV9zXrC65XZ3UI
	MAvZSh5UUJvtRictRlCRfkSqW3GJMl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1715902345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GKp+kBPnFAkOZUY2XXPskauDFmieuBfEsmE+HXmtfXw=;
	b=PpiwqvT+Hj8Q0ndEx/n5eV/aAsfRYvtyRe/iqcFEAhDAZC8Pa+59JzCP2SBqQFL87ki3Ye
	rMLyZNCyPoCBrHBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D898713991;
	Thu, 16 May 2024 23:32:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7qzVNIiXRmb5NQAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 16 May 2024 23:32:24 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 6AF48A08BE; Fri, 17 May 2024 01:32:22 +0200 (CEST)
Date: Fri, 17 May 2024 01:32:22 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Amir Goldstein <amir73il@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	David Howells <dhowells@redhat.com>, Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Seth Forshee <sforshee@kernel.org>, linux-fsdevel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs: nls: add missing MODULE_DESCRIPTION() macros
Message-ID: <20240516233222.movcrfkgcof2euzb@quack3>
References: <20240516-md-fs-nls-v1-1-ed540d8239bf@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516-md-fs-nls-v1-1-ed540d8239bf@quicinc.com>
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 865CD35172
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[zeniv.linux.org.uk,gmail.com,kernel.org,oracle.com,intel.com,redhat.com,suse.cz,infradead.org,szeredi.hu,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,quicinc.com:email]

On Thu 16-05-24 09:50:55, Jeff Johnson wrote:
> Fix the following allmodconfig "make W=1" issues:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-croatian.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-iceland.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-turkish.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1251.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1255.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp737.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp775.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp850.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp852.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp855.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp862.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp865.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp866.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp874.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp932.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp936.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp949.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp950.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_euc-jp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-13.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-14.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-3.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-5.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-7.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Makes sense. Thanks for the fixup. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
> MAINTAINERS doesn't have any matches for fs/nls so I manually added
> maintainers and reviewers from other fs/* entries. Sorry for casting
> a large net, but hope I catch the correct maintainer.
> ---
>  fs/nls/mac-celtic.c     | 1 +
>  fs/nls/mac-centeuro.c   | 1 +
>  fs/nls/mac-croatian.c   | 1 +
>  fs/nls/mac-cyrillic.c   | 1 +
>  fs/nls/mac-gaelic.c     | 1 +
>  fs/nls/mac-greek.c      | 1 +
>  fs/nls/mac-iceland.c    | 1 +
>  fs/nls/mac-inuit.c      | 1 +
>  fs/nls/mac-roman.c      | 1 +
>  fs/nls/mac-romanian.c   | 1 +
>  fs/nls/mac-turkish.c    | 1 +
>  fs/nls/nls_ascii.c      | 1 +
>  fs/nls/nls_base.c       | 1 +
>  fs/nls/nls_cp1250.c     | 1 +
>  fs/nls/nls_cp1251.c     | 1 +
>  fs/nls/nls_cp1255.c     | 1 +
>  fs/nls/nls_cp437.c      | 1 +
>  fs/nls/nls_cp737.c      | 1 +
>  fs/nls/nls_cp775.c      | 1 +
>  fs/nls/nls_cp850.c      | 1 +
>  fs/nls/nls_cp852.c      | 1 +
>  fs/nls/nls_cp855.c      | 1 +
>  fs/nls/nls_cp857.c      | 1 +
>  fs/nls/nls_cp860.c      | 1 +
>  fs/nls/nls_cp861.c      | 1 +
>  fs/nls/nls_cp862.c      | 1 +
>  fs/nls/nls_cp863.c      | 1 +
>  fs/nls/nls_cp864.c      | 1 +
>  fs/nls/nls_cp865.c      | 1 +
>  fs/nls/nls_cp866.c      | 1 +
>  fs/nls/nls_cp869.c      | 1 +
>  fs/nls/nls_cp874.c      | 1 +
>  fs/nls/nls_cp932.c      | 1 +
>  fs/nls/nls_cp936.c      | 1 +
>  fs/nls/nls_cp949.c      | 1 +
>  fs/nls/nls_cp950.c      | 1 +
>  fs/nls/nls_euc-jp.c     | 1 +
>  fs/nls/nls_iso8859-1.c  | 1 +
>  fs/nls/nls_iso8859-13.c | 1 +
>  fs/nls/nls_iso8859-14.c | 1 +
>  fs/nls/nls_iso8859-15.c | 1 +
>  fs/nls/nls_iso8859-2.c  | 1 +
>  fs/nls/nls_iso8859-3.c  | 1 +
>  fs/nls/nls_iso8859-4.c  | 1 +
>  fs/nls/nls_iso8859-5.c  | 1 +
>  fs/nls/nls_iso8859-6.c  | 1 +
>  fs/nls/nls_iso8859-7.c  | 1 +
>  fs/nls/nls_iso8859-9.c  | 1 +
>  fs/nls/nls_koi8-r.c     | 1 +
>  fs/nls/nls_koi8-ru.c    | 1 +
>  fs/nls/nls_koi8-u.c     | 1 +
>  fs/nls/nls_ucs2_utils.c | 1 +
>  fs/nls/nls_utf8.c       | 1 +
>  53 files changed, 53 insertions(+)
> 
> diff --git a/fs/nls/mac-celtic.c b/fs/nls/mac-celtic.c
> index 266c2d7d50bd..2963f3299d7e 100644
> --- a/fs/nls/mac-celtic.c
> +++ b/fs/nls/mac-celtic.c
> @@ -598,4 +598,5 @@ static void __exit exit_nls_macceltic(void)
>  module_init(init_nls_macceltic)
>  module_exit(exit_nls_macceltic)
>  
> +MODULE_DESCRIPTION("NLS Codepage macceltic");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/mac-centeuro.c b/fs/nls/mac-centeuro.c
> index 9789c6057551..43b20f4bdb67 100644
> --- a/fs/nls/mac-centeuro.c
> +++ b/fs/nls/mac-centeuro.c
> @@ -528,4 +528,5 @@ static void __exit exit_nls_maccenteuro(void)
>  module_init(init_nls_maccenteuro)
>  module_exit(exit_nls_maccenteuro)
>  
> +MODULE_DESCRIPTION("NLS Codepage maccenteuro");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/mac-croatian.c b/fs/nls/mac-croatian.c
> index bb19e7a07d43..62730d6a64e5 100644
> --- a/fs/nls/mac-croatian.c
> +++ b/fs/nls/mac-croatian.c
> @@ -598,4 +598,5 @@ static void __exit exit_nls_maccroatian(void)
>  module_init(init_nls_maccroatian)
>  module_exit(exit_nls_maccroatian)
>  
> +MODULE_DESCRIPTION("NLS Codepage maccroatian");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/mac-cyrillic.c b/fs/nls/mac-cyrillic.c
> index 2a7dea36acba..7a5c4d16aac8 100644
> --- a/fs/nls/mac-cyrillic.c
> +++ b/fs/nls/mac-cyrillic.c
> @@ -493,4 +493,5 @@ static void __exit exit_nls_maccyrillic(void)
>  module_init(init_nls_maccyrillic)
>  module_exit(exit_nls_maccyrillic)
>  
> +MODULE_DESCRIPTION("NLS Codepage maccyrillic");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/mac-gaelic.c b/fs/nls/mac-gaelic.c
> index 77b001653588..3d22f03a90b6 100644
> --- a/fs/nls/mac-gaelic.c
> +++ b/fs/nls/mac-gaelic.c
> @@ -563,4 +563,5 @@ static void __exit exit_nls_macgaelic(void)
>  module_init(init_nls_macgaelic)
>  module_exit(exit_nls_macgaelic)
>  
> +MODULE_DESCRIPTION("NLS Codepage macgaelic");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/mac-greek.c b/fs/nls/mac-greek.c
> index 1eccf499e2eb..de3aa9ddb5b1 100644
> --- a/fs/nls/mac-greek.c
> +++ b/fs/nls/mac-greek.c
> @@ -493,4 +493,5 @@ static void __exit exit_nls_macgreek(void)
>  module_init(init_nls_macgreek)
>  module_exit(exit_nls_macgreek)
>  
> +MODULE_DESCRIPTION("NLS Codepage macgreek");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/mac-iceland.c b/fs/nls/mac-iceland.c
> index cbd0875c6d69..0bba83f9d415 100644
> --- a/fs/nls/mac-iceland.c
> +++ b/fs/nls/mac-iceland.c
> @@ -598,4 +598,5 @@ static void __exit exit_nls_maciceland(void)
>  module_init(init_nls_maciceland)
>  module_exit(exit_nls_maciceland)
>  
> +MODULE_DESCRIPTION("NLS Codepage maciceland");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/mac-inuit.c b/fs/nls/mac-inuit.c
> index fba8357aaf03..493386832dfd 100644
> --- a/fs/nls/mac-inuit.c
> +++ b/fs/nls/mac-inuit.c
> @@ -528,4 +528,5 @@ static void __exit exit_nls_macinuit(void)
>  module_init(init_nls_macinuit)
>  module_exit(exit_nls_macinuit)
>  
> +MODULE_DESCRIPTION("NLS Codepage macinuit");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/mac-roman.c b/fs/nls/mac-roman.c
> index b6a98a5208cd..d3c082173c20 100644
> --- a/fs/nls/mac-roman.c
> +++ b/fs/nls/mac-roman.c
> @@ -633,4 +633,5 @@ static void __exit exit_nls_macroman(void)
>  module_init(init_nls_macroman)
>  module_exit(exit_nls_macroman)
>  
> +MODULE_DESCRIPTION("NLS Codepage macroman");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/mac-romanian.c b/fs/nls/mac-romanian.c
> index 25547f023638..a7735852f2d5 100644
> --- a/fs/nls/mac-romanian.c
> +++ b/fs/nls/mac-romanian.c
> @@ -598,4 +598,5 @@ static void __exit exit_nls_macromanian(void)
>  module_init(init_nls_macromanian)
>  module_exit(exit_nls_macromanian)
>  
> +MODULE_DESCRIPTION("NLS Codepage macromanian");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/mac-turkish.c b/fs/nls/mac-turkish.c
> index b5454bc7b7fa..d77e9b6b7d7c 100644
> --- a/fs/nls/mac-turkish.c
> +++ b/fs/nls/mac-turkish.c
> @@ -598,4 +598,5 @@ static void __exit exit_nls_macturkish(void)
>  module_init(init_nls_macturkish)
>  module_exit(exit_nls_macturkish)
>  
> +MODULE_DESCRIPTION("NLS Codepage macturkish");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_ascii.c b/fs/nls/nls_ascii.c
> index a2620650d5e4..068143d71284 100644
> --- a/fs/nls/nls_ascii.c
> +++ b/fs/nls/nls_ascii.c
> @@ -163,4 +163,5 @@ static void __exit exit_nls_ascii(void)
>  module_init(init_nls_ascii)
>  module_exit(exit_nls_ascii)
>  
> +MODULE_DESCRIPTION("NLS ASCII (United States)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_base.c b/fs/nls/nls_base.c
> index a026dbd3593f..18d597e49a19 100644
> --- a/fs/nls/nls_base.c
> +++ b/fs/nls/nls_base.c
> @@ -545,4 +545,5 @@ EXPORT_SYMBOL(unload_nls);
>  EXPORT_SYMBOL(load_nls);
>  EXPORT_SYMBOL(load_nls_default);
>  
> +MODULE_DESCRIPTION("Base file system native language support");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp1250.c b/fs/nls/nls_cp1250.c
> index ace3e19d3407..e22a57a4b828 100644
> --- a/fs/nls/nls_cp1250.c
> +++ b/fs/nls/nls_cp1250.c
> @@ -343,4 +343,5 @@ static void __exit exit_nls_cp1250(void)
>  module_init(init_nls_cp1250)
>  module_exit(exit_nls_cp1250)
>  
> +MODULE_DESCRIPTION("NLS Windows CP1250 (Slavic/Central European Languages)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp1251.c b/fs/nls/nls_cp1251.c
> index 9273ddfd08a1..6f46d339f23c 100644
> --- a/fs/nls/nls_cp1251.c
> +++ b/fs/nls/nls_cp1251.c
> @@ -298,4 +298,5 @@ static void __exit exit_nls_cp1251(void)
>  module_init(init_nls_cp1251)
>  module_exit(exit_nls_cp1251)
>  
> +MODULE_DESCRIPTION("NLS Windows CP1251 (Bulgarian, Belarusian)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp1255.c b/fs/nls/nls_cp1255.c
> index 1caf5dfed85b..299e089d4301 100644
> --- a/fs/nls/nls_cp1255.c
> +++ b/fs/nls/nls_cp1255.c
> @@ -380,5 +380,6 @@ static void __exit exit_nls_cp1255(void)
>  module_init(init_nls_cp1255)
>  module_exit(exit_nls_cp1255)
>  
> +MODULE_DESCRIPTION("NLS Hebrew charsets (ISO-8859-8, CP1255)");
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_ALIAS_NLS(iso8859-8);
> diff --git a/fs/nls/nls_cp437.c b/fs/nls/nls_cp437.c
> index 7ddb830da3fd..ab880499ea32 100644
> --- a/fs/nls/nls_cp437.c
> +++ b/fs/nls/nls_cp437.c
> @@ -384,4 +384,5 @@ static void __exit exit_nls_cp437(void)
>  module_init(init_nls_cp437)
>  module_exit(exit_nls_cp437)
>  
> +MODULE_DESCRIPTION("NLS Codepage 437 (United States, Canada)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp737.c b/fs/nls/nls_cp737.c
> index c593f683a0cd..5c37618296e9 100644
> --- a/fs/nls/nls_cp737.c
> +++ b/fs/nls/nls_cp737.c
> @@ -347,4 +347,5 @@ static void __exit exit_nls_cp737(void)
>  module_init(init_nls_cp737)
>  module_exit(exit_nls_cp737)
>  
> +MODULE_DESCRIPTION("NLS Codepage 737 (Greek)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp775.c b/fs/nls/nls_cp775.c
> index 554c863745f2..51ccc908901f 100644
> --- a/fs/nls/nls_cp775.c
> +++ b/fs/nls/nls_cp775.c
> @@ -316,4 +316,5 @@ static void __exit exit_nls_cp775(void)
>  module_init(init_nls_cp775)
>  module_exit(exit_nls_cp775)
>  
> +MODULE_DESCRIPTION("NLS Codepage 775 (Baltic Rim)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp850.c b/fs/nls/nls_cp850.c
> index 56cccd14b40b..5f9b9507a8b6 100644
> --- a/fs/nls/nls_cp850.c
> +++ b/fs/nls/nls_cp850.c
> @@ -312,4 +312,5 @@ static void __exit exit_nls_cp850(void)
>  module_init(init_nls_cp850)
>  module_exit(exit_nls_cp850)
>  
> +MODULE_DESCRIPTION("NLS Codepage 850 (Europe)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp852.c b/fs/nls/nls_cp852.c
> index 7cdc05ac1d40..fc513a5e8358 100644
> --- a/fs/nls/nls_cp852.c
> +++ b/fs/nls/nls_cp852.c
> @@ -334,4 +334,5 @@ static void __exit exit_nls_cp852(void)
>  module_init(init_nls_cp852)
>  module_exit(exit_nls_cp852)
>  
> +MODULE_DESCRIPTION("NLS Codepage 852 (Central/Eastern Europe)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp855.c b/fs/nls/nls_cp855.c
> index 7426eea05663..a43be58adb36 100644
> --- a/fs/nls/nls_cp855.c
> +++ b/fs/nls/nls_cp855.c
> @@ -296,4 +296,5 @@ static void __exit exit_nls_cp855(void)
>  module_init(init_nls_cp855)
>  module_exit(exit_nls_cp855)
>  
> +MODULE_DESCRIPTION("NLS Codepage 855 (Cyrillic)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp857.c b/fs/nls/nls_cp857.c
> index 098309733ebd..772cd4195bad 100644
> --- a/fs/nls/nls_cp857.c
> +++ b/fs/nls/nls_cp857.c
> @@ -298,4 +298,5 @@ static void __exit exit_nls_cp857(void)
>  module_init(init_nls_cp857)
>  module_exit(exit_nls_cp857)
>  
> +MODULE_DESCRIPTION("NLS Codepage 857 (Turkish)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp860.c b/fs/nls/nls_cp860.c
> index 84224478e731..36cf4ca11966 100644
> --- a/fs/nls/nls_cp860.c
> +++ b/fs/nls/nls_cp860.c
> @@ -361,4 +361,5 @@ static void __exit exit_nls_cp860(void)
>  module_init(init_nls_cp860)
>  module_exit(exit_nls_cp860)
>  
> +MODULE_DESCRIPTION("NLS Codepage 860 (Portuguese)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp861.c b/fs/nls/nls_cp861.c
> index dc873e4be092..b7397d079f8f 100644
> --- a/fs/nls/nls_cp861.c
> +++ b/fs/nls/nls_cp861.c
> @@ -384,4 +384,5 @@ static void __exit exit_nls_cp861(void)
>  module_init(init_nls_cp861)
>  module_exit(exit_nls_cp861)
>  
> +MODULE_DESCRIPTION("NLS Codepage 861 (Icelandic)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp862.c b/fs/nls/nls_cp862.c
> index d5263e3c5566..fd3b95d1e95d 100644
> --- a/fs/nls/nls_cp862.c
> +++ b/fs/nls/nls_cp862.c
> @@ -418,4 +418,5 @@ static void __exit exit_nls_cp862(void)
>  module_init(init_nls_cp862)
>  module_exit(exit_nls_cp862)
>  
> +MODULE_DESCRIPTION("NLS Codepage 862 (Hebrew)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp863.c b/fs/nls/nls_cp863.c
> index 051c9832e36a..813ae7944249 100644
> --- a/fs/nls/nls_cp863.c
> +++ b/fs/nls/nls_cp863.c
> @@ -378,4 +378,5 @@ static void __exit exit_nls_cp863(void)
>  module_init(init_nls_cp863)
>  module_exit(exit_nls_cp863)
>  
> +MODULE_DESCRIPTION("NLS Codepage 863 (Canadian French)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp864.c b/fs/nls/nls_cp864.c
> index 97eb1273b2f7..d9eb6d5cd47a 100644
> --- a/fs/nls/nls_cp864.c
> +++ b/fs/nls/nls_cp864.c
> @@ -404,4 +404,5 @@ static void __exit exit_nls_cp864(void)
>  module_init(init_nls_cp864)
>  module_exit(exit_nls_cp864)
>  
> +MODULE_DESCRIPTION("NLS Codepage 864 (Arabic)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp865.c b/fs/nls/nls_cp865.c
> index 111214228525..2678ffd98bb6 100644
> --- a/fs/nls/nls_cp865.c
> +++ b/fs/nls/nls_cp865.c
> @@ -384,4 +384,5 @@ static void __exit exit_nls_cp865(void)
>  module_init(init_nls_cp865)
>  module_exit(exit_nls_cp865)
>  
> +MODULE_DESCRIPTION("NLS Codepage 865 (Norwegian, Danish)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp866.c b/fs/nls/nls_cp866.c
> index ffdcbc3fc38d..7e93d0a3802a 100644
> --- a/fs/nls/nls_cp866.c
> +++ b/fs/nls/nls_cp866.c
> @@ -302,4 +302,5 @@ static void __exit exit_nls_cp866(void)
>  module_init(init_nls_cp866)
>  module_exit(exit_nls_cp866)
>  
> +MODULE_DESCRIPTION("NLS Codepage 866 (Cyrillic/Russian)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp869.c b/fs/nls/nls_cp869.c
> index 3b5a34589354..4491737dd5cb 100644
> --- a/fs/nls/nls_cp869.c
> +++ b/fs/nls/nls_cp869.c
> @@ -312,4 +312,5 @@ static void __exit exit_nls_cp869(void)
>  module_init(init_nls_cp869)
>  module_exit(exit_nls_cp869)
>  
> +MODULE_DESCRIPTION("NLS Codepage 869 (Greek)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_cp874.c b/fs/nls/nls_cp874.c
> index 8dfaa10710fa..4fcfbf8ca72c 100644
> --- a/fs/nls/nls_cp874.c
> +++ b/fs/nls/nls_cp874.c
> @@ -271,5 +271,6 @@ static void __exit exit_nls_cp874(void)
>  module_init(init_nls_cp874)
>  module_exit(exit_nls_cp874)
>  
> +MODULE_DESCRIPTION("NLS Thai charset (CP874, TIS-620)");
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_ALIAS_NLS(tis-620);
> diff --git a/fs/nls/nls_cp932.c b/fs/nls/nls_cp932.c
> index 67b7398e8483..e5e6270fcca6 100644
> --- a/fs/nls/nls_cp932.c
> +++ b/fs/nls/nls_cp932.c
> @@ -7929,5 +7929,6 @@ static void __exit exit_nls_cp932(void)
>  module_init(init_nls_cp932)
>  module_exit(exit_nls_cp932)
>  
> +MODULE_DESCRIPTION("NLS Japanese charset (Shift-JIS)");
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_ALIAS_NLS(sjis);
> diff --git a/fs/nls/nls_cp936.c b/fs/nls/nls_cp936.c
> index c96546cfec9f..91d0a15fd7f9 100644
> --- a/fs/nls/nls_cp936.c
> +++ b/fs/nls/nls_cp936.c
> @@ -11107,5 +11107,6 @@ static void __exit exit_nls_cp936(void)
>  module_init(init_nls_cp936)
>  module_exit(exit_nls_cp936)
>  
> +MODULE_DESCRIPTION("NLS Simplified Chinese charset (CP936, GB2312)");
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_ALIAS_NLS(gb2312);
> diff --git a/fs/nls/nls_cp949.c b/fs/nls/nls_cp949.c
> index 199171e97aa4..3ae03c76d59c 100644
> --- a/fs/nls/nls_cp949.c
> +++ b/fs/nls/nls_cp949.c
> @@ -13942,5 +13942,6 @@ static void __exit exit_nls_cp949(void)
>  module_init(init_nls_cp949)
>  module_exit(exit_nls_cp949)
>  
> +MODULE_DESCRIPTION("NLS Korean charset (CP949, EUC-KR)");
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_ALIAS_NLS(euc-kr);
> diff --git a/fs/nls/nls_cp950.c b/fs/nls/nls_cp950.c
> index 8e1418708209..e968aa80198d 100644
> --- a/fs/nls/nls_cp950.c
> +++ b/fs/nls/nls_cp950.c
> @@ -9478,5 +9478,6 @@ static void __exit exit_nls_cp950(void)
>  module_init(init_nls_cp950)
>  module_exit(exit_nls_cp950)
>  
> +MODULE_DESCRIPTION("NLS Traditional Chinese charset (Big5)");
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_ALIAS_NLS(big5);
> diff --git a/fs/nls/nls_euc-jp.c b/fs/nls/nls_euc-jp.c
> index 162b3f160353..0191cc9d955e 100644
> --- a/fs/nls/nls_euc-jp.c
> +++ b/fs/nls/nls_euc-jp.c
> @@ -577,4 +577,5 @@ static void __exit exit_nls_euc_jp(void)
>  module_init(init_nls_euc_jp)
>  module_exit(exit_nls_euc_jp)
>  
> +MODULE_DESCRIPTION("NLS Japanese charset (EUC-JP)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_iso8859-1.c b/fs/nls/nls_iso8859-1.c
> index 69ac020d43b1..a181be488f7d 100644
> --- a/fs/nls/nls_iso8859-1.c
> +++ b/fs/nls/nls_iso8859-1.c
> @@ -254,4 +254,5 @@ static void __exit exit_nls_iso8859_1(void)
>  module_init(init_nls_iso8859_1)
>  module_exit(exit_nls_iso8859_1)
>  
> +MODULE_DESCRIPTION("NLS ISO 8859-1 (Latin 1; Western European Languages)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_iso8859-13.c b/fs/nls/nls_iso8859-13.c
> index afb3f8f275f0..8e2be5bfeaf1 100644
> --- a/fs/nls/nls_iso8859-13.c
> +++ b/fs/nls/nls_iso8859-13.c
> @@ -282,4 +282,5 @@ static void __exit exit_nls_iso8859_13(void)
>  module_init(init_nls_iso8859_13)
>  module_exit(exit_nls_iso8859_13)
>  
> +MODULE_DESCRIPTION("NLS ISO 8859-13 (Latin 7; Baltic)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_iso8859-14.c b/fs/nls/nls_iso8859-14.c
> index 046370f0b6f0..c789eccb8a69 100644
> --- a/fs/nls/nls_iso8859-14.c
> +++ b/fs/nls/nls_iso8859-14.c
> @@ -338,4 +338,5 @@ static void __exit exit_nls_iso8859_14(void)
>  module_init(init_nls_iso8859_14)
>  module_exit(exit_nls_iso8859_14)
>  
> +MODULE_DESCRIPTION("NLS ISO 8859-14 (Latin 8; Celtic)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_iso8859-15.c b/fs/nls/nls_iso8859-15.c
> index 7e34a841a056..ffec649176fb 100644
> --- a/fs/nls/nls_iso8859-15.c
> +++ b/fs/nls/nls_iso8859-15.c
> @@ -304,4 +304,5 @@ static void __exit exit_nls_iso8859_15(void)
>  module_init(init_nls_iso8859_15)
>  module_exit(exit_nls_iso8859_15)
>  
> +MODULE_DESCRIPTION("NLS ISO 8859-15 (Latin 9; Western European Languages with Euro)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_iso8859-2.c b/fs/nls/nls_iso8859-2.c
> index 7dd571181741..d352334d0314 100644
> --- a/fs/nls/nls_iso8859-2.c
> +++ b/fs/nls/nls_iso8859-2.c
> @@ -305,4 +305,5 @@ static void __exit exit_nls_iso8859_2(void)
>  module_init(init_nls_iso8859_2)
>  module_exit(exit_nls_iso8859_2)
>  
> +MODULE_DESCRIPTION("NLS ISO 8859-2 (Latin 2; Slavic/Central European Languages)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_iso8859-3.c b/fs/nls/nls_iso8859-3.c
> index 740b75ec4493..09990e6634d2 100644
> --- a/fs/nls/nls_iso8859-3.c
> +++ b/fs/nls/nls_iso8859-3.c
> @@ -305,4 +305,5 @@ static void __exit exit_nls_iso8859_3(void)
>  module_init(init_nls_iso8859_3)
>  module_exit(exit_nls_iso8859_3)
>  
> +MODULE_DESCRIPTION("NLS ISO 8859-3 (Latin 3; Esperanto, Galician, Maltese, Turkish)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_iso8859-4.c b/fs/nls/nls_iso8859-4.c
> index 8826021e32f5..92795224912e 100644
> --- a/fs/nls/nls_iso8859-4.c
> +++ b/fs/nls/nls_iso8859-4.c
> @@ -305,4 +305,5 @@ static void __exit exit_nls_iso8859_4(void)
>  module_init(init_nls_iso8859_4)
>  module_exit(exit_nls_iso8859_4)
>  
> +MODULE_DESCRIPTION("NLS ISO 8859-4 (Latin 4; old Baltic charset)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_iso8859-5.c b/fs/nls/nls_iso8859-5.c
> index 7c04057a1ad8..32309315307a 100644
> --- a/fs/nls/nls_iso8859-5.c
> +++ b/fs/nls/nls_iso8859-5.c
> @@ -269,4 +269,5 @@ static void __exit exit_nls_iso8859_5(void)
>  module_init(init_nls_iso8859_5)
>  module_exit(exit_nls_iso8859_5)
>  
> +MODULE_DESCRIPTION("NLS ISO 8859-5 (Cyrillic)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_iso8859-6.c b/fs/nls/nls_iso8859-6.c
> index d4a881400d74..c18183469d2a 100644
> --- a/fs/nls/nls_iso8859-6.c
> +++ b/fs/nls/nls_iso8859-6.c
> @@ -260,4 +260,5 @@ static void __exit exit_nls_iso8859_6(void)
>  module_init(init_nls_iso8859_6)
>  module_exit(exit_nls_iso8859_6)
>  
> +MODULE_DESCRIPTION("NLS ISO 8859-6 (Arabic)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_iso8859-7.c b/fs/nls/nls_iso8859-7.c
> index 37b75d825a75..3652d6832864 100644
> --- a/fs/nls/nls_iso8859-7.c
> +++ b/fs/nls/nls_iso8859-7.c
> @@ -314,4 +314,5 @@ static void __exit exit_nls_iso8859_7(void)
>  module_init(init_nls_iso8859_7)
>  module_exit(exit_nls_iso8859_7)
>  
> +MODULE_DESCRIPTION("NLS ISO 8859-7 (Modern Greek)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_iso8859-9.c b/fs/nls/nls_iso8859-9.c
> index 557b98250d37..11a67834b855 100644
> --- a/fs/nls/nls_iso8859-9.c
> +++ b/fs/nls/nls_iso8859-9.c
> @@ -269,4 +269,5 @@ static void __exit exit_nls_iso8859_9(void)
>  module_init(init_nls_iso8859_9)
>  module_exit(exit_nls_iso8859_9)
>  
> +MODULE_DESCRIPTION("NLS ISO 8859-9 (Latin 5; Turkish)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_koi8-r.c b/fs/nls/nls_koi8-r.c
> index 811f232fccfb..e3dca27a3803 100644
> --- a/fs/nls/nls_koi8-r.c
> +++ b/fs/nls/nls_koi8-r.c
> @@ -320,4 +320,5 @@ static void __exit exit_nls_koi8_r(void)
>  module_init(init_nls_koi8_r)
>  module_exit(exit_nls_koi8_r)
>  
> +MODULE_DESCRIPTION("NLS KOI8-R (Russian)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_koi8-ru.c b/fs/nls/nls_koi8-ru.c
> index a80a741a8676..07afcd9e58c0 100644
> --- a/fs/nls/nls_koi8-ru.c
> +++ b/fs/nls/nls_koi8-ru.c
> @@ -79,4 +79,5 @@ static void __exit exit_nls_koi8_ru(void)
>  module_init(init_nls_koi8_ru)
>  module_exit(exit_nls_koi8_ru)
>  
> +MODULE_DESCRIPTION("NLS KOI8-RU (Belarusian)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_koi8-u.c b/fs/nls/nls_koi8-u.c
> index 7e029e4c188a..f60645758c1a 100644
> --- a/fs/nls/nls_koi8-u.c
> +++ b/fs/nls/nls_koi8-u.c
> @@ -327,4 +327,5 @@ static void __exit exit_nls_koi8_u(void)
>  module_init(init_nls_koi8_u)
>  module_exit(exit_nls_koi8_u)
>  
> +MODULE_DESCRIPTION("NLS KOI8-U (Ukrainian)");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/fs/nls/nls_ucs2_utils.c b/fs/nls/nls_ucs2_utils.c
> index a69781c54dd8..d4564b79d7bf 100644
> --- a/fs/nls/nls_ucs2_utils.c
> +++ b/fs/nls/nls_ucs2_utils.c
> @@ -16,6 +16,7 @@
>  #include <asm/unaligned.h>
>  #include "nls_ucs2_utils.h"
>  
> +MODULE_DESCRIPTION("NLS UCS-2");
>  MODULE_LICENSE("GPL");
>  
>  /*
> diff --git a/fs/nls/nls_utf8.c b/fs/nls/nls_utf8.c
> index afcfbc4a14db..a0fa0610eaac 100644
> --- a/fs/nls/nls_utf8.c
> +++ b/fs/nls/nls_utf8.c
> @@ -64,4 +64,5 @@ static void __exit exit_nls_utf8(void)
>  
>  module_init(init_nls_utf8)
>  module_exit(exit_nls_utf8)
> +MODULE_DESCRIPTION("NLS UTF-8");
>  MODULE_LICENSE("Dual BSD/GPL");
> 
> ---
> base-commit: 8c06da67d0bd3139a97f301b4aa9c482b9d4f29e
> change-id: 20240516-md-fs-nls-4ff7a416ab85
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

