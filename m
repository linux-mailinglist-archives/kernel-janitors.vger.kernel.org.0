Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C1239DB70
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Jun 2021 13:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhFGLg7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Jun 2021 07:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbhFGLg6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 07:36:58 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20EEC061766
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Jun 2021 04:35:06 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id i6so9801518ybm.1
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Jun 2021 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YvdQB4sJMg2Z7tM85nbxejGlE1ZQjxUxBw864dPtWow=;
        b=V9obAOJHy815po7qOGlD1lZ3HIpSm2H+SPdkwXC0VpM9libu8qpIoGDO0O/asFbzLA
         PhQthXuUriN6xzZqXWp2XGxIllknOwWSV9wXCQ4lSSkEPko7wo0vou/N9NSJm6OfSvKs
         2gSNvdNKj1buVL4Qvn6F27nKhK9emGvHji3u9J8bQhXt8t1bRPNbNO8Di8FKfAzHcIgi
         4CS+MondAn0F9GxPdrLLixSeax1wVGXoGjlR0QaND8vs3EPVBrVN/yFd1FOk+3il7690
         /66dodPqOn5RwihYdpaKAVl0+DnLj7aK3nk+2xd7ffcn+/oLvKhdJgo2Eju9I67oU7qK
         1eDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YvdQB4sJMg2Z7tM85nbxejGlE1ZQjxUxBw864dPtWow=;
        b=DGvKoF9t5XPeShCWzNs+fnMI3rays78P2uRYI5B66uAQCSVDm6jK6pn6vXKf7Zv3CA
         0vFwrR0krfbTws/+h/r9CEWMQAw9fReKUjUV/XwcN1xCdOixDS+tOJ/UzFhVzBt1aDsW
         UAyV7SNWbke66s7Fggy7Fho6ML+T9qHc8Yq9VNpofHfitiljNO9qewiac/MiLdvqaRHt
         wh0a7Hxl5D0RF1lWk/Zxop/Txe+nowdbMjHuG503DLUkdqIqWVKg0hrQsgWrTDeNzFMH
         SY618BGL2Sn+IpmW+2l637pTKdYCr4ZvAulqngbW4i4xfmyujOfRnQIwTSaG3Tgk28x8
         ahZw==
X-Gm-Message-State: AOAM532wD6gi+vk8wRWA95l/QSH0mGkG70KWuX+zKZp6v8d8McHAlZPW
        e3dKcL0rvJcDmeGI9aWsyGyU7iawXE/gjSAPM6GmKQ==
X-Google-Smtp-Source: ABdhPJyipDBqX1lv/e4w9rH6CLAff20wMUvkIkL3v92eJ93588UtqbJj2G6rcnPQmQHmqKDRkePkoTbcepBwmngdk6s=
X-Received: by 2002:a5b:58e:: with SMTP id l14mr7340010ybp.303.1623065705405;
 Mon, 07 Jun 2021 04:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <1623058534-78782-1-git-send-email-chengshuyi@linux.alibaba.com>
In-Reply-To: <1623058534-78782-1-git-send-email-chengshuyi@linux.alibaba.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 7 Jun 2021 13:34:54 +0200
Message-ID: <CANn89iLNf+73MsPH7O7wX3PrN26FVLcjw_SmsN6jNwnjrYg4KQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: tcp: Updating MSS, when the sending window
 is smaller than MSS.
To:     Shuyi Cheng <chengshuyi@linux.alibaba.com>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 7, 2021 at 11:35 AM Shuyi Cheng
<chengshuyi@linux.alibaba.com> wrote:
>
> When the lo network card is used for communication, the tcp server
> reduces the size of the receiving buffer, causing the tcp client
> to have a delay of 200ms. Examples are as follows:
>
> Suppose that the MTU of the lo network card is 65536, and the tcp server
> sets the receive buffer size to 42KB. According to the
> tcp_bound_to_half_wnd function, the MSS of the server and client is
> 21KB. Then, the tcp server sets the buffer size of the connection to
> 16KB. At this time, the MSS of the server is 8KB, and the MSS of the
> client is still 21KB. But it will cause the client to fail to send the
> message, that is, tcp_write_xmit fails. Mainly because tcp_snd_wnd_test
> failed, and then entered the zero window detection phase, resulting in a
> 200ms delay.
>
> Therefore, we mainly modify two places. One is the tcp_current_mss
> function. When the sending window is smaller than the current mss, mss
> needs to be updated. The other is the tcp_bound_to_half_wnd function.
> When the sending window is smaller than the current mss, the mss value
> should be calculated according to the current sending window, not
> max_window.
>
> Signed-off-by: Shuyi Cheng <chengshuyi@linux.alibaba.com>
> ---
>  include/net/tcp.h     | 11 ++++++++---
>  net/ipv4/tcp_output.c |  3 ++-
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index e668f1b..fcdef16 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -641,6 +641,11 @@ static inline void tcp_clear_xmit_timers(struct sock *sk)
>  static inline int tcp_bound_to_half_wnd(struct tcp_sock *tp, int pktsize)
>  {
>         int cutoff;
> +       int window;
> +
> +       window = tp->max_window;
> +       if (tp->snd_wnd && tp->snd_wnd < pktsize)
> +               window = tp->snd_wnd;
>
>         /* When peer uses tiny windows, there is no use in packetizing
>          * to sub-MSS pieces for the sake of SWS or making sure there
> @@ -649,10 +654,10 @@ static inline int tcp_bound_to_half_wnd(struct tcp_sock *tp, int pktsize)
>          * On the other hand, for extremely large MSS devices, handling
>          * smaller than MSS windows in this way does make sense.
>          */
> -       if (tp->max_window > TCP_MSS_DEFAULT)
> -               cutoff = (tp->max_window >> 1);
> +       if (window > TCP_MSS_DEFAULT)
> +               cutoff = (window >> 1);
>         else
> -               cutoff = tp->max_window;
> +               cutoff = window;
>
>         if (cutoff && pktsize > cutoff)
>                 return max_t(int, cutoff, 68U - tp->tcp_header_len);
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index bde781f..88dcdf2 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -1833,7 +1833,8 @@ unsigned int tcp_current_mss(struct sock *sk)
>
>         if (dst) {
>                 u32 mtu = dst_mtu(dst);
> -               if (mtu != inet_csk(sk)->icsk_pmtu_cookie)
> +               if (mtu != inet_csk(sk)->icsk_pmtu_cookie ||
> +                   (tp->snd_wnd && tp->snd_wnd < mss_now))
>                         mss_now = tcp_sync_mss(sk, mtu);


I do not think we want to add code in fast path only to cope with
pathological user choices.

Maybe it is time to accept the fact that setting the receive buffer
size to 42KB is dumb nowadays.

TCP needs to have at least two buffers in flight to avoid 'strange' stalls.

If loopback MTU is 64KB  (and TSO/GRO sizes also can reach 64K), maybe
we need to ensure a minimal rcvbuf.

If applications set 42KB window size, they get what they asked for :
damn slow TCP communications.

We do not want to make them happy, while increasing cpu costs for 99%
of other uses cases which are not trying to make TCP miserable.

I would rather add a sysctl or something to ensure rcvbuf has a
minimal sane value, instead of risking subtle TCP regressions.

In 2021, we should not limit ourselves to memory constraints that were
common 40 years ago when TCP was invented.

References :
commit 9eb5bf838d06aa6ddebe4aca6b5cedcf2eb53b86 net: sock: fix
TCP_SKB_MIN_TRUESIZE
commit eea86af6b1e18d6fa8dc959e3ddc0100f27aff9f net: sock: adapt
SOCK_MIN_RCVBUF and SOCK_MIN_SNDBUF
