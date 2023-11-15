Return-Path: <kernel-janitors+bounces-228-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AC37E8D90
	for <lists+kernel-janitors@lfdr.de>; Sun, 12 Nov 2023 00:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB4A11F20F76
	for <lists+kernel-janitors@lfdr.de>; Sat, 11 Nov 2023 23:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DF61DFEA;
	Sat, 11 Nov 2023 23:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TUWsG0Ia"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D101D6A6
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Nov 2023 23:39:12 +0000 (UTC)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [IPv6:2001:41d0:1004:224b::bc])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E764C7
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Nov 2023 15:39:11 -0800 (PST)
Date: Sat, 11 Nov 2023 18:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1699745947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bY38uoL3AzwYw27KFUn5BoU0Pr+lAR8U8j2TvcseFJU=;
	b=TUWsG0Ias66t2B3KVVYr7DFZSdj2lgF1ESXEOUdEPI0uIxcDqKbKXQhNHv8JZSRShhSWwg
	bfA/DsZ0pXxYGOvCRGQiMq40cugAKnNL6kXXf6z446Rzg/W1o/SdLva61q8u58zOf1LWVT
	Z7eI7U3rVcKDdTeHg9hwlfqZzbkeabg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: David Laight <David.Laight@ACULAB.COM>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Brian Foster <bfoster@redhat.com>,
	"linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] bcachefs: remove redundant initialization of
 variable level
Message-ID: <20231111233904.zxgqyw3epefiqiro@moria.home.lan>
References: <20231111204528.339603-1-colin.i.king@gmail.com>
 <20231111210208.qra7xhf2nd4pqvst@moria.home.lan>
 <184af6778ab64b3eb6a4a6071974d5e8@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <184af6778ab64b3eb6a4a6071974d5e8@AcuMS.aculab.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Nov 11, 2023 at 09:19:40PM +0000, David Laight wrote:
> From: Kent Overstreet <kent.overstreet@linux.dev>
> > Sent: 11 November 2023 21:02
> > > Variable level is being initialized a value that is never read, the
> > > variable is being re-assigned another value several statements later
> > > on. The initialization is redundant and can be removed. Cleans up
> > > clang scan build warning:
> > >
> > > fs/bcachefs/btree_iter.c:1217:11: warning: Value stored to 'level'
> > > during its initialization is never read [deadcode.DeadStores]
> > >
> > > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > 
> > since we're no longer gnu89, we can simply declare the variable when
> > it's first used, like so:
> 
> ugg... I think that is still frowned upon.
> It makes it very difficult for the average human to find
> the variable declaration.

No, it's 2023, there's no good reason to be declaring variables before
giving them values.

