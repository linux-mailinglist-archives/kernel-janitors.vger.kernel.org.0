Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E2839FB63
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Jun 2021 17:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbhFHQAJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 8 Jun 2021 12:00:09 -0400
Received: from mail-yb1-f181.google.com ([209.85.219.181]:43788 "EHLO
        mail-yb1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233422AbhFHQAI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Jun 2021 12:00:08 -0400
Received: by mail-yb1-f181.google.com with SMTP id b9so30866801ybg.10
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Jun 2021 08:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mOKOIq8+dYHWTbCv5NLXUNKJlpBcBerbHjSKFdojRik=;
        b=h3YRdFXpdMPPdgBhfa/xP/935XiRLbSV5xkxzsfn/2ZVSNKPjiFCpv+z5w3dwDqXa5
         j02tEOY226P0oUC0qZrwklgFhZ38ksI4Qo8H+3GBDrigPamHDvm735Te6MroBspnVLC6
         Ni6LkiCvHRVjUmG4Afh3GYZWwv+swRUzsiniPJpNYsb6Adi5Dn6vN6OM6/W4fDBB2Ftm
         dOUUJOxwge0y95TEIhl1y4rzn/t6z9taoV9/m4Agv3DO0ySRzjwi79gMhCt0sNtbhbec
         01xtWkEBZH8suH9Rl6/Mda95psbG7pOjL2zrTRRdhFROrJdhbPLNukO6wicF6FPyrebO
         OfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mOKOIq8+dYHWTbCv5NLXUNKJlpBcBerbHjSKFdojRik=;
        b=lovQAQvXEqex+AESMDRtBGRBHq9r80CwzPQvg28jl3ygYcJ4m+efRze9/e34bGlVdj
         UVlHNz3oKvLLb2njVNKd6Z5ZMglarAPxzgnhgsFSRsrrRsIWG5UL4ktYcAhi5yzmoycU
         n+0zDKj0g/RiEyRk/ljBVYEPkRvCHPEwIEv8m9aMim3enNyQvyCHMVz9vHC6zU2BrwNV
         4ifZfyR0ee353Adlg9mEooHGg+mOj98Vv8Xn7o0dtZDxUtuUhsbX0IhgmE6dKZHsl+pj
         Fpmr3PDj8YXN8i/Uh9hyGJ1KjRB2gk7OieovPUslKiUsHygWnidhr9+2mZU6TMix1IDB
         GG3g==
X-Gm-Message-State: AOAM530XWqMd4svBIzzrc7o2m+y7E4r4GeYMCCejadpi93s85NzMTM6u
        GKI+k/IPaBIycDKGlhKUb5wl5MA0UqjGSL539HoI0Q==
X-Google-Smtp-Source: ABdhPJx0boQ3F+6xFECVoJeyUwN/AYaKz29nJEnnBf5vlO9V8hp1KxNdyYYk3VbfW+NP4rQ8B8z4isqSnyvW/HtvCnU=
X-Received: by 2002:a25:a4c2:: with SMTP id g60mr20082425ybi.452.1623167823222;
 Tue, 08 Jun 2021 08:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <1623058534-78782-1-git-send-email-chengshuyi@linux.alibaba.com>
 <CANn89iLNf+73MsPH7O7wX3PrN26FVLcjw_SmsN6jNwnjrYg4KQ@mail.gmail.com> <0e938649-986d-ce79-e3c4-1f29bdcb64e0@linux.alibaba.com>
In-Reply-To: <0e938649-986d-ce79-e3c4-1f29bdcb64e0@linux.alibaba.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Tue, 8 Jun 2021 17:56:52 +0200
Message-ID: <CANn89iKnT5Ebk5vovFJKHY4Fe7ERkN3ak_Nkqyc=vXL=VWvyPg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: tcp: Updating MSS, when the sending window
 is smaller than MSS.
To:     Shuyi Cheng <chengshuyi@linux.alibaba.com>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Mao Wenan <wenan.mao@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 8, 2021 at 4:26 AM Shuyi Cheng <chengshuyi@linux.alibaba.com> wrote:
>
>
>
> On 6/7/21 7:34 PM, Eric Dumazet wrote:
> > On Mon, Jun 7, 2021 at 11:35 AM Shuyi Cheng
> > <chengshuyi@linux.alibaba.com> wrote:
> >>
> >> When the lo network card is used for communication, the tcp server
> >> reduces the size of the receiving buffer, causing the tcp client
> >> to have a delay of 200ms. Examples are as follows:
> >>
> >> Suppose that the MTU of the lo network card is 65536, and the tcp server
> >> sets the receive buffer size to 42KB. According to the
> >> tcp_bound_to_half_wnd function, the MSS of the server and client is
> >> 21KB. Then, the tcp server sets the buffer size of the connection to
> >> 16KB. At this time, the MSS of the server is 8KB, and the MSS of the
> >> client is still 21KB. But it will cause the client to fail to send the
> >> message, that is, tcp_write_xmit fails. Mainly because tcp_snd_wnd_test
> >> failed, and then entered the zero window detection phase, resulting in a
> >> 200ms delay.
> >>
> >> Therefore, we mainly modify two places. One is the tcp_current_mss
> >> function. When the sending window is smaller than the current mss, mss
> >> needs to be updated. The other is the tcp_bound_to_half_wnd function.
> >> When the sending window is smaller than the current mss, the mss value
> >> should be calculated according to the current sending window, not
> >> max_window.
> >>
> >> Signed-off-by: Shuyi Cheng <chengshuyi@linux.alibaba.com>
> >> ---
> >>   include/net/tcp.h     | 11 ++++++++---
> >>   net/ipv4/tcp_output.c |  3 ++-
> >>   2 files changed, 10 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/include/net/tcp.h b/include/net/tcp.h
> >> index e668f1b..fcdef16 100644
> >> --- a/include/net/tcp.h
> >> +++ b/include/net/tcp.h
> >> @@ -641,6 +641,11 @@ static inline void tcp_clear_xmit_timers(struct sock *sk)
> >>   static inline int tcp_bound_to_half_wnd(struct tcp_sock *tp, int pktsize)
> >>   {
> >>          int cutoff;
> >> +       int window;
> >> +
> >> +       window = tp->max_window;
> >> +       if (tp->snd_wnd && tp->snd_wnd < pktsize)
> >> +               window = tp->snd_wnd;
> >>
> >>          /* When peer uses tiny windows, there is no use in packetizing
> >>           * to sub-MSS pieces for the sake of SWS or making sure there
> >> @@ -649,10 +654,10 @@ static inline int tcp_bound_to_half_wnd(struct tcp_sock *tp, int pktsize)
> >>           * On the other hand, for extremely large MSS devices, handling
> >>           * smaller than MSS windows in this way does make sense.
> >>           */
> >> -       if (tp->max_window > TCP_MSS_DEFAULT)
> >> -               cutoff = (tp->max_window >> 1);
> >> +       if (window > TCP_MSS_DEFAULT)
> >> +               cutoff = (window >> 1);
> >>          else
> >> -               cutoff = tp->max_window;
> >> +               cutoff = window;
> >>
> >>          if (cutoff && pktsize > cutoff)
> >>                  return max_t(int, cutoff, 68U - tp->tcp_header_len);
> >> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> >> index bde781f..88dcdf2 100644
> >> --- a/net/ipv4/tcp_output.c
> >> +++ b/net/ipv4/tcp_output.c
> >> @@ -1833,7 +1833,8 @@ unsigned int tcp_current_mss(struct sock *sk)
> >>
> >>          if (dst) {
> >>                  u32 mtu = dst_mtu(dst);
> >> -               if (mtu != inet_csk(sk)->icsk_pmtu_cookie)
> >> +               if (mtu != inet_csk(sk)->icsk_pmtu_cookie ||
> >> +                   (tp->snd_wnd && tp->snd_wnd < mss_now))
> >>                          mss_now = tcp_sync_mss(sk, mtu);
> >
> >
> > I do not think we want to add code in fast path only to cope with
> > pathological user choices.
> >
>
> Thank you very much for your reply!
>
> I very much agree with your point of view. However, the kernel currently
> accepts the unreasonable RCVBUF set by the developer, that is, the set
> RCVBUF is smaller than MSS. Perhaps, we can avoid setting RCVBUF to be
> smaller than MSS in the sock_setsockopt function. What do you think?

I think this is not trivial to make the limit being MSS dependent,
because SO_RCVBUF can be set before connection is attempted.
(So the MSS is not yet known)

I would rather simply add a sysctl to set a floor for TCP SO_RCVBUF,
and default it to a reasonable value (128KB ?)

The sysctl might be needed for some crazy environments (one million
TCP flows on a host with only 8 GB of memory for example...)

>
> Thanks.
>
> > Maybe it is time to accept the fact that setting the receive buffer
> > size to 42KB is dumb nowadays.
> >
> > TCP needs to have at least two buffers in flight to avoid 'strange' stalls.
> >
> > If loopback MTU is 64KB  (and TSO/GRO sizes also can reach 64K), maybe
> > we need to ensure a minimal rcvbuf.
> >
> > If applications set 42KB window size, they get what they asked for :
> > damn slow TCP communications.
> >
> > We do not want to make them happy, while increasing cpu costs for 99%
> > of other uses cases which are not trying to make TCP miserable.
> >
> > I would rather add a sysctl or something to ensure rcvbuf has a
> > minimal sane value, instead of risking subtle TCP regressions.
> >
> > In 2021, we should not limit ourselves to memory constraints that were
> > common 40 years ago when TCP was invented.
> >
> > References :
> > commit 9eb5bf838d06aa6ddebe4aca6b5cedcf2eb53b86 net: sock: fix
> > TCP_SKB_MIN_TRUESIZE
> > commit eea86af6b1e18d6fa8dc959e3ddc0100f27aff9f net: sock: adapt
> > SOCK_MIN_RCVBUF and SOCK_MIN_SNDBUF
> >
