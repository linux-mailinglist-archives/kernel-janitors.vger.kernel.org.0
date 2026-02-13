Return-Path: <kernel-janitors+bounces-10198-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBgrEdAcj2lQJAEAu9opvQ
	(envelope-from <kernel-janitors+bounces-10198-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Feb 2026 13:45:04 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A40891361ED
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Feb 2026 13:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5427F301BCEA
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Feb 2026 12:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BC335B631;
	Fri, 13 Feb 2026 12:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uvf/YHGI"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B8318D658
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Feb 2026 12:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770986701; cv=none; b=nnts/kGvAibNMMegbio6d9DR1JXVmVQH3FT0fC2LhWqbXCyAsKTNgyqFyAr+BcnACKIg4ocI1r4garI6IRj/74RAO98RydiEyl7n7qeiAkXR14beqeis4kDjVqXmJ7mooB97tXC4qdARwRG1M9pe1HoxNK7PFafJczIb8iySdSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770986701; c=relaxed/simple;
	bh=/Zt6khdhGfH3Hkoe052E7yZXR/qlFYcR5e3cmtxk5rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgxhhsBqjjgcCRDrxGw/aTacHvgBuJ2Or9KcKpVAZDBHbsgm4qnf5Tp50xOwybAyc/DtKaV4DpVHXZxR+oGzqBrcEgYw+n9WTcveMndkxuuUklBcj4hYYI4GpBH0dS3m6MkbNz3UrwZtjIm8TzrtksNT7cugli+FGSuEtnnAQeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uvf/YHGI; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e5ed7303cso63794e87.3
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Feb 2026 04:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770986698; x=1771591498; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r7nT78nIm0YLmarabSYPD2yv/puF0ssCbcpZBWsZgYU=;
        b=Uvf/YHGIAegDJ96laazeY3XdnOMw+cHNd6+fCotQOrXA///FsleXfg/mE7otC2OINC
         jb8OgMP1HOEu+HfoZYHeUXNKKeA75UlmJNJlclXgUCu4xD7qDBJR31eiL7cdEHXAZ/wA
         xm0reflO7B6sGa9igqPwdH1MhwVFzyO0lBQnojlgFTlyZ3NlDdunqsFVvewhp3Ns/e+L
         z4bNhiocNG3lSBjuZNOLyeqNWAyHl/KXoVizpY9e3ypfyNPEFJIH/hCXEcfV9v6iSt2M
         eG6WSq23B+LicaWI7UGXMFTZrqpphoPIJWXdf26xI3oJzyyhM7zZBi71KvohKB4BbWu5
         nXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770986698; x=1771591498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7nT78nIm0YLmarabSYPD2yv/puF0ssCbcpZBWsZgYU=;
        b=rxu12/+mnS+N/KAc6ytTwGgPNthKC5J0uElL+mJvHvVSfg6gfQctuR6GRw5sGCmGAO
         fo8S6O50OBqRnPRVjlKFb0Pgi18WFXsps7DxU/n6Jn2T384iY6kOhJcNL8ZR+nlYLXnh
         EOemLIOj/KFxjEPCeK4G9SaChWwsfnMyI1QxB6U3KMiKuzbXHgyOvMfnvjFOUb+njDyW
         rf8O15/UnZCh8+Pvu+p0R4yWe6Vz71xUzRvjEaqrJcxVaxsRJe5jkDlP2GnoWyU1cy+s
         C67c/HrRJD9C50dKutI/yWbWSNsX0d0XiiLbXqePlw5lQYJdGxaMBWZfg6+eop+ldO+n
         5EzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiUSLAKRC9AuEPFo8HOG6hetVcKmjvUvNE/nTESbktL56dOCE/PfX1UshGlEeTMR3cayFKAUBe4ltrEVEc4K0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpoSfTJdpK3AOFEKfXWNSB/XVaKmV+XJJ4kMnix0ebudA3oCyT
	0Ngaqx1cVVOB9XeVII1upIWpgFZ+hMIwuoJYkgJd6u4+nmVAUmxYSa9t
X-Gm-Gg: AZuq6aLYrwp7Rn/AQBpleP1R/fOg3ExxqjNBmopYfGwPFJ1yzphxjZXFosUzBJosKGF
	GU3oxvLn6vRKMsweUhjHkHSffZGZz5v3qv+y8xGh4LVBzDOrtVGMADrHR1/3v4fsOTfm+3fyx6B
	DB//3hEZJeAs21cjtOadPFUKNGCLsIT9LPW1bsIErQkczvnwyFed5jhrhxxZL6u27VGeiE9FQ6o
	jp16MXYV3ocoiQkCrNk1FwQMG4nQRJ0xeu96k9du4tFRQeyefC91cqES7f5rATOHnYWaqIIq5/Z
	4n07+ndanoRtyZsS73NBUlyYcySN8kNz7Mz4S1r+H5meVxdhA0p2K+iTTYdMI9cglxquYSNLwrU
	ROXH8ss60JQaExkLm3NLGSGci6IlCLJTSLnXDHcgySUfK/jrgKarMOwDmESKuPKZyjsTTysDrRf
	sRbbyX7uM5MZSAfCA=
X-Received: by 2002:a05:600c:4448:b0:47b:d992:601e with SMTP id 5b1f17b1804b1-48370e2b6bemr23412015e9.2.1770979593031;
        Fri, 13 Feb 2026 02:46:33 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:419a:75c9:94a4:7ac3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4c4sm444065575e9.10.2026.02.13.02.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 02:46:32 -0800 (PST)
Date: Fri, 13 Feb 2026 12:46:29 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Felix Gu <ustc.gu@gmail.com>, linux-phy@lists.infradead.org,
	Jyri Sarha <jsarha@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] phy: ti: j721e-wiz: Fix device node reference leak in
 wiz_get_lane_phy_types()
Message-ID: <20260213104629.q5pwqpsuficmx6qv@skbuf>
References: <20260212-wiz-v2-1-6e8bd4cc7a4a@gmail.com>
 <ffafec42-8d5f-429a-92b5-1b92c7643642@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffafec42-8d5f-429a-92b5-1b92c7643642@web.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10198-lists,kernel-janitors=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,ti.com,kernel.org,linaro.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[web.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,kernel-janitors@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A40891361ED
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 09:09:55AM +0100, Markus Elfring wrote:
> …
> > ---
> > Changes in v2:
> > - Use of_node_put() suggested by Vladimir Oltean.
> > - Link to v1: https://lore.kernel.org/r/20260211-wiz-v1-1-fdd018d02f33@gmail.com
> > ---
> >  drivers/phy/ti/phy-j721e-wiz.c | 2 ++
> …
> 
> * Would you like to complete the exception handling by using another goto chain?
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v6.19#n526

While gotos have their place, here it seems simpler not to use them.
Felix would have needed to move the "int ret" variable from the
for_each_child_of_node_scoped() scope to the function scope, and
initialize it with 0. All that is unnecessary complexity here.

> * How do you think about to increase the application of scope-based resource management
>   by additional update steps?
>   https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/cleanup.h#L157-L161

The cleanup.h API does not exist in all kernels where this bug fix can
be backported.

