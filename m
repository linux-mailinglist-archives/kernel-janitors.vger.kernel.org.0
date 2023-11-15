Return-Path: <kernel-janitors+bounces-236-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AEB7E9231
	for <lists+kernel-janitors@lfdr.de>; Sun, 12 Nov 2023 20:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72C90280A8D
	for <lists+kernel-janitors@lfdr.de>; Sun, 12 Nov 2023 19:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C335A168DD;
	Sun, 12 Nov 2023 19:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UuQqcR78"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE30168C1
	for <kernel-janitors@vger.kernel.org>; Sun, 12 Nov 2023 19:12:57 +0000 (UTC)
X-Greylist: delayed 70425 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Nov 2023 11:12:54 PST
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1C52139
	for <kernel-janitors@vger.kernel.org>; Sun, 12 Nov 2023 11:12:54 -0800 (PST)
Date: Sun, 12 Nov 2023 14:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1699816372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=owK5K5JdLzVRnDED3gH7oBxQq6jSJ2aub73V6sOFjG0=;
	b=UuQqcR78JbL6WO/lhV2imsqRml90rXyuZDAQjueJbT+/G0+ysaev5QSNdjjrGieI6Reogk
	CDL9t5d8gld12zX4vNhoRyeRxzLF9T431eAcph4wAM2exgm+pIcvrjHQ2m2CqIpAXoJJLO
	vQvHSpIjP2woTi7BsfQNuUdy47OJLMA=
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
Message-ID: <20231112191249.srvcmay2yeewy7ql@moria.home.lan>
References: <20231111204528.339603-1-colin.i.king@gmail.com>
 <20231111210208.qra7xhf2nd4pqvst@moria.home.lan>
 <184af6778ab64b3eb6a4a6071974d5e8@AcuMS.aculab.com>
 <20231111233904.zxgqyw3epefiqiro@moria.home.lan>
 <d106f21ef1164241a275b1f11b82e7b7@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d106f21ef1164241a275b1f11b82e7b7@AcuMS.aculab.com>
X-Migadu-Flow: FLOW_OUT

On Sun, Nov 12, 2023 at 06:34:59PM +0000, David Laight wrote:
> From: Kent Overstreet
> > Sent: 11 November 2023 23:39
> > 
> > On Sat, Nov 11, 2023 at 09:19:40PM +0000, David Laight wrote:
> > > From: Kent Overstreet <kent.overstreet@linux.dev>
> > > > Sent: 11 November 2023 21:02
> > > > > Variable level is being initialized a value that is never read, the
> > > > > variable is being re-assigned another value several statements later
> > > > > on. The initialization is redundant and can be removed. Cleans up
> > > > > clang scan build warning:
> > > > >
> > > > > fs/bcachefs/btree_iter.c:1217:11: warning: Value stored to 'level'
> > > > > during its initialization is never read [deadcode.DeadStores]
> > > > >
> > > > > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > > >
> > > > since we're no longer gnu89, we can simply declare the variable when
> > > > it's first used, like so:
> > >
> > > ugg... I think that is still frowned upon.
> > > It makes it very difficult for the average human to find
> > > the variable declaration.
> > 
> > No, it's 2023, there's no good reason to be declaring variables before
> > giving them values.
> 
> The year has nothing to do with whether it is a good idea.
> It is epically bad without -Wshadow.
> (Have you ever played 'stop the declaration' in C++, it isn't fun.)
> 
> Finding declarations is bad enough when they are at the top
> of a big block, never mind in the middle of a load of assignments.

David, I don't want you giving this kind of advice here, and if finding
declarations is something you have trouble with - perhaps find something
easier to do.

