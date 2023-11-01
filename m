Return-Path: <kernel-janitors+bounces-109-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B7C7DE5EC
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 19:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF709281882
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 18:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE35A18E06;
	Wed,  1 Nov 2023 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAB1A28
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 18:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83491C433C8;
	Wed,  1 Nov 2023 18:17:08 +0000 (UTC)
Date: Wed, 1 Nov 2023 14:17:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gregkh@linuxfoundation.org, keescook@chromium.org, willy@infradead.org,
 senozhatsky@chromium.org, list@mail.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/2] seq_buf: Export seq_buf_putc() &nd seq_buf_puts()
Message-ID: <20231101141705.4208d441@gandalf.local.home>
In-Reply-To: <cover.1698861216.git.christophe.jaillet@wanadoo.fr>
References: <cover.1698861216.git.christophe.jaillet@wanadoo.fr>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  1 Nov 2023 18:59:04 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> seq_buf_putc() has a potential real use-case (link in the patch), but 
> seq_buf_puts() has currently no forseen use-case, so I have split it in 2
> patches if only the 1st one is accepted.
> 
> Christophe JAILLET (2):
>   seq_buf: Export seq_buf_putc()
>   seq_buf: Export seq_buf_puts()
> 
>  lib/seq_buf.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

I can pull these in as I'm getting ready for my pull request to Linus soon
(and just kicked off my testing).

Or do you need them as part of the patch you mentioned? When does that need
to go in? Can it wait till it hits Linus's tree?

-- Steve

