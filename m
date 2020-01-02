Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8685612E8DE
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Jan 2020 17:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgABQqG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 2 Jan 2020 11:46:06 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40241 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728828AbgABQqF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 2 Jan 2020 11:46:05 -0500
Received: by mail-ot1-f67.google.com with SMTP id w21so49970132otj.7
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Jan 2020 08:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HrXZHjoaqPfSnNyTU19HMM3kSDFb9R+CP52wZpLZIuo=;
        b=oZDMXInUNArVNUW5UNFWUMC7Jp695Zoz74GDjl3LBV/bbxKG4HUUE40V3jrzG3y8Ui
         zui1rKKQiyH1UjgmgJUeBORIa0he8Ne2fxb7MCqdhLjMnvQlSs6rMeDncPncb9oMWR++
         SlRcj6X6nm8RU3QrlEQO0zwdSBSVKAir5650sALyjB4rksyfnGJeBaHAQHLznsN/hNgr
         DV7Zq2a6w9mu2w0P92jtFgWwCD2gH23ZyQ8B2EpNp7Dwr2xY1jVoBZ7aOL501MrVfpJs
         bpaMb8W8TuVqIKLf2aQOYr8rqtn3e4y74kMvmvpN2RoYk8mJsqhHCz6kcAnQKCMS/Au6
         2/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HrXZHjoaqPfSnNyTU19HMM3kSDFb9R+CP52wZpLZIuo=;
        b=NW70dyT1vC6XugsZecC76GiyTySWvuE6+9JW436Z1AWD7H3m0LHgGAKvolDQoj3Z/a
         ijmxMZSe5bJ/qoJr4iQU80bXkQWzamhqAlQjkE/7+JREP3QGw9XTwWOl95nxzGTm6Udb
         jgXs0t1OD0Pcqf4brqPJ3jnruzzMUiLmnQPka9Q3Clt4uJNvCYFCVBFWveK9eotwvKJe
         Hr6Hi1QhFRR5gyZE0eMc7g73dHaHDUIvAeLqoiGNJag5MXbK1aInOZR6PJULwA6fo8Lm
         WlNmgwBs2PoKtfvziS1Q3S880DmDyhfsqHQzaYTPXHnJE8moNNdm9A3u+npYlzqXOQe0
         SMmw==
X-Gm-Message-State: APjAAAVrZ9tSkpFjATgaRLTScJapEhRNooOdE1g+fKHHY3QJH2WAJSNH
        tSKUfi8o8uqKMGk9hhrA+hpKhDwmllNeLsZujTBdnQ==
X-Google-Smtp-Source: APXvYqxNR6tJSFG+nNhBns9AiJC4Vz3aJuxdYOA+lViL6S/GhV34pahJfNY4e6HdAyOhE+9OkDjamKNTONdnU5WDZgA=
X-Received: by 2002:a05:6830:13da:: with SMTP id e26mr19927139otq.302.1577983564414;
 Thu, 02 Jan 2020 08:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20200102140227.77780-1-maowenan@huawei.com>
In-Reply-To: <20200102140227.77780-1-maowenan@huawei.com>
From:   Neal Cardwell <ncardwell@google.com>
Date:   Thu, 2 Jan 2020 11:45:47 -0500
Message-ID: <CADVnQy=osX-HAnRduPid27tNZHLrzudT+5C4-+K3ERY-BMW3VA@mail.gmail.com>
Subject: Re: [PATCH net-next] tcp: use REXMIT_NEW instead of magic number
To:     Mao Wenan <maowenan@huawei.com>
Cc:     Eric Dumazet <edumazet@google.com>,
        David Miller <davem@davemloft.net>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Yuchung Cheng <ycheng@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jan 2, 2020 at 9:07 AM Mao Wenan <maowenan@huawei.com> wrote:
>
> REXMIT_NEW is a macro for "FRTO-style
> transmit of unsent/new packets", this patch
> makes it more readable.
>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  net/ipv4/tcp_input.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 88b987ca9ebb..1d1e3493965f 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -3550,7 +3550,7 @@ static void tcp_xmit_recovery(struct sock *sk, int rexmit)
>         if (rexmit == REXMIT_NONE || sk->sk_state == TCP_SYN_SENT)
>                 return;
>
> -       if (unlikely(rexmit == 2)) {
> +       if (unlikely(rexmit == REXMIT_NEW)) {
>                 __tcp_push_pending_frames(sk, tcp_current_mss(sk),
>                                           TCP_NAGLE_OFF);
>                 if (after(tp->snd_nxt, tp->high_seq))
> --

Acked-by: Neal Cardwell <ncardwell@google.com>

Thanks for sending this patch!

neal
