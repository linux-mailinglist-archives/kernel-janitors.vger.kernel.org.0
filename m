Return-Path: <kernel-janitors+bounces-659-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E180DF53
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Dec 2023 00:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F11942825FE
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Dec 2023 23:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA9756745;
	Mon, 11 Dec 2023 23:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLdRvGEC"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3130856456;
	Mon, 11 Dec 2023 23:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F889C433C7;
	Mon, 11 Dec 2023 23:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702336458;
	bh=TjroB8MQohW/qXBzN/75T8H6mvlVZuzk+Zd9agPIoH0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OLdRvGECLv7RQj1DPTbISv0ich2vzvNj09wIzcaN3Ahd1wXiWL34OBYOG0wB4/XRZ
	 /367XRi863iFhA/i4z35+DafbYKzBz5bY1S6DM2dXNkiDnD9nDvZYw67eMNCfNHwbw
	 80b6o8ZoYMTJO61/HU7kgLeMeQraTJRj3t1xxhpe5fYRQ2PXcNuVEIUHS8ui/2wdVP
	 wusuqmuFWKzKU9xHKXgneRVVjhPwEgR1VS5yDZXsHEOiaynqb5tFVo5XrLuOQnaGEF
	 iEVq9hUb5CKNtrTCmtxuTGZsSjcyPK7bRRuxRrzwXwcrqtyd8gJrazoVNaaix5pH+5
	 bE1rUby2yj8mg==
Date: Tue, 12 Dec 2023 08:14:13 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux trace kernel
 <linux-trace-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, outreachy@lists.linux.dev,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] tracing: Update snapshot buffer on resize if it is
 allocated
Message-Id: <20231212081413.c4710c1b643ac4e0b975a122@kernel.org>
In-Reply-To: <20231211125152.045f8b8a@gandalf.local.home>
References: <20231210225447.48476a6a@rorschach.local.home>
	<20231211213134.bd21cf745b8c5a0892891946@kernel.org>
	<20231211125152.045f8b8a@gandalf.local.home>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Dec 2023 12:51:52 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 11 Dec 2023 21:31:34 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> 
> > On Sun, 10 Dec 2023 22:54:47 -0500
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> > 
> > > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > > 
> > > The snapshot buffer is to mimic the main buffer so that when a snapshot is
> > > needed, the snapshot and main buffer are swapped. When the snapshot buffer
> > > is allocated, it is set to the minimal size that the ring buffer may be at
> > > and still functional. When it is allocated it becomes the same size as the
> > > main ring buffer, and when the main ring buffer changes in size, it should
> > > do.  
> > 
> > nit: There seems two "when the snapshot buffer is allocated" case, maybe latter
> > "it" means main buffer?
> 
> I changed the paragraph to be:
> 
>     The snapshot buffer is to mimic the main buffer so that when a snapshot is
>     needed, the snapshot and main buffer are swapped. When the snapshot buffer
>     is allocated, it is set to the minimal size that the ring buffer may be at
>     and still functional. When it is allocated it becomes the same size as the
>     main ring buffer, and when the main ring buffer changes in size, the
>     snapshot should also change in size if it is allocated.

Yeah, this makes clearer.

> 
> > 
> > > 
> > > Currently, the resize only updates the snapshot buffer if it's used by the
> > > current tracer (ie. the preemptirqsoff tracer). But it needs to be updated
> > > anytime it is allocated.
> > > 
> > > When changing the size of the main buffer, instead of looking to see if
> > > the current tracer is utilizing the snapshot buffer, just check if it is
> > > allocated to know if it should be updated or not.
> > > 
> > > Also fix typo in comment just above the code change.
> > >   
> > 
> > Looks good to me.
> > 
> > Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Thanks!
> 
> > 
> > BTW, the historical naming leads this kind of issues.
> > Maybe we'd better to rename 'max_buffer' to 'snapshot_buffer'?
> 
> Agreed. But that's a cleanup for another day. Hmm, maybe that too should be
> marked as "KTODO"?

Yes!

> 
>   https://lore.kernel.org/all/369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain/
> 

Ah, this is a good idea.

> 
> There's a lot of things that we have been discussing on these ring-buffer
> patches that could be KTODO items.

Thanks,

> 
> -- Steve


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

