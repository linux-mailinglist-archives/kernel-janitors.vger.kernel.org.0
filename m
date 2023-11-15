Return-Path: <kernel-janitors+bounces-91-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3B37DDD5E
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 08:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 486FE2818EA
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 07:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBEA63A3;
	Wed,  1 Nov 2023 07:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="k05IFa8G"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460655C9A
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 07:41:46 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDBFEA
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 00:41:44 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id y5rAqxjn51jHcy5rAqb1Lk; Wed, 01 Nov 2023 08:41:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698824503;
	bh=W0JdcYadX1Uj/95T3fXcyVaHAA0+IQtzR59DL7bY2cg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=k05IFa8GzXylwHKRm10nhBZrgD7pVppqAA7dozugSEw0Fy+64nxdUFNGBCOXE9MVM
	 fa6D/XqpE2vvTEtMUs8821cAnm1QP0K6Vw7ns9Naih7xVsoN+YAygefGd6CExXUTlN
	 Py7BKtTktPAF+9X+Qab78w2BNEUH1d76TfhGxGW60ubrsuqRCN+TyWi/xwquuSdK9s
	 7G7lOyLXOWWQkXeqI+U6OdduGHER7avOFjXT1brQvNRTPyqzBN/pOjqHzWe4bOG1Q5
	 TTUWZ3OVcOPTesfZLtw1fSCDSISILZLqFhaEntd+01EGHmsZT1e0LZexXbtCprNi14
	 OEecP7VhLj3Pw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 01 Nov 2023 08:41:43 +0100
X-ME-IP: 86.243.2.178
Message-ID: <37ab9219-a049-4a43-b555-83b1629e5a48@wanadoo.fr>
Date: Wed, 1 Nov 2023 08:41:39 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] refscale: Optimize process_durations()
To: paulmck@kernel.org
Cc: Davidlohr Bueso <dave@stgolabs.net>, Josh Triplett
 <josh@joshtriplett.org>, Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 rcu@vger.kernel.org, Kees Cook <keescook@chromium.org>
References: <bbbab32e3e104bdc2238724a6a4a85e539f49ddd.1698512661.git.christophe.jaillet@wanadoo.fr>
 <ozbrmbywamyfkv3amsf2dfdacwmi25serwhc75h6fpsahklsmo@rm43srgxumef>
 <bcd6bfe1-9891-4f22-86ad-361330e47e9d@paulmck-laptop>
 <a6943003-da31-4ac7-8944-c7dc06381148@paulmck-laptop>
Content-Language: fr, en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <a6943003-da31-4ac7-8944-c7dc06381148@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 31/10/2023 à 23:47, Paul E. McKenney a écrit :
> On Tue, Oct 31, 2023 at 11:21:14AM -0700, Paul E. McKenney wrote:
>> On Mon, Oct 30, 2023 at 09:55:16AM -0700, Davidlohr Bueso wrote:
>>> On Sat, 28 Oct 2023, Christophe JAILLET wrote:
>>>
>>>> process_durations() is not a hot path, but there is no good reason to
>>>> iterate over and over the data already in 'buf'.
>>>>
>>>> Using a seq_buf saves some useless strcat() and the need of a temp buffer.
>>>> Data is written directly at the correct place.
>>>
>>> Makes sense.
>>>
>>> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
>>
>> Queued and pushed, thank you all!
> 
> But an allmodconfig build complains about seq_buf_putc() being undefined,
> that is, not exported.  I suspect that other seq_buf_*() functions in
> this patch might also be complained about.
> 
> I am dropping this for the moment.  Please make it pass an allmodconfig
> build so that I can pull it in again.  Please see below for the commit.
> 
> 							Thanx, Paul
> 

Ouch!

seq_buf_init(), seq_buf_terminate(), seq_buf_clear() are inlined 
functions in a .h file, so shouldn't be a problem.

seq_buf_printf() is exported, but seq_buf_putc() is not!
Really odd to me.

Kees Cook (added in cc) suggests to use this API (see [1]) to avoid some 
potential issues and ease the management of NULL terminated strings in 
buffers. (#LinuxHardening).

I'll propose to add the missing EXPORT_SYMBOL_GPL.

CJ

[1]: https://lore.kernel.org/all/202310241629.0A4206316F@keescook/


