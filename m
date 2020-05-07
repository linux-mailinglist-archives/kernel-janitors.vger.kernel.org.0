Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90071C9CAA
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 May 2020 22:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgEGUuz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 7 May 2020 16:50:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:34006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726218AbgEGUuy (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 May 2020 16:50:54 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F5BF20735;
        Thu,  7 May 2020 20:50:55 +0000 (UTC)
Date:   Thu, 7 May 2020 16:50:53 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        linux-kernel@vger.kernel.org,
        Nic Volanschi <eugene.volanschi@inria.fr>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] tracing/probe: reverse arguments to list_add
Message-ID: <20200507165053.291ba5ea@gandalf.local.home>
In-Reply-To: <1588879808-24488-1-git-send-email-Julia.Lawall@inria.fr>
References: <1588879808-24488-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu,  7 May 2020 21:30:08 +0200
Julia Lawall <Julia.Lawall@inria.fr> wrote:

> Elsewhere in the file, the function trace_kprobe_has_same_kprobe uses
> a trace_probe_event.probes object as the second argument of
> list_for_each_entry, ie as a list head, while the list_for_each_entry
> iterates over the list fields of the trace_probe structures, making
> them the list elements.  So, exchange the arguments on the list_add
> call to put the list head in the second argument.
> 
> Since both list_head structures were just initialized, this problem
> did not cause any loss of information.
> 
> Fixes: 60d53e2c3b75 ("tracing/probe: Split trace_event related data from trace_probe")
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Masami,

Can you give a Reviewed-by to this?

-- Steve

> 
> ---
>  kernel/trace/trace_probe.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
> index ab8b6436d53f..b8a928e925c7 100644
> --- a/kernel/trace/trace_probe.c
> +++ b/kernel/trace/trace_probe.c
> @@ -1006,7 +1006,7 @@ int trace_probe_init(struct trace_probe *tp, const char *event,
>  	INIT_LIST_HEAD(&tp->event->class.fields);
>  	INIT_LIST_HEAD(&tp->event->probes);
>  	INIT_LIST_HEAD(&tp->list);
> -	list_add(&tp->event->probes, &tp->list);
> +	list_add(&tp->list, &tp->event->probes);
>  
>  	call = trace_probe_event_call(tp);
>  	call->class = &tp->event->class;

