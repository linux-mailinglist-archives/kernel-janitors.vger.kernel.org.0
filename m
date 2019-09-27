Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43167C07F4
	for <lists+kernel-janitors@lfdr.de>; Fri, 27 Sep 2019 16:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbfI0OtI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 27 Sep 2019 10:49:08 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45580 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbfI0OtH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Sep 2019 10:49:07 -0400
Received: by mail-lj1-f195.google.com with SMTP id q64so2745744ljb.12
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2019 07:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KY62cZcmvsX3xM03mBE6HBbDYvpNvwvQeq59nLOyZl0=;
        b=UL3FcFE2NfXwtjvIvldZ2MUHIneNoq+mJEDmSgWEOp1dFr4eIlKaEqUNo+C3YqExFG
         mV39oyx+CARY2Od6aZhcw0xcNCszg5/Q3S+h7ceTavOyGJif5F+TDzGJfY15EoWKVtvv
         +eNRqBqk5d655UGD36nFXLsuwmoMmc/PkD048FcYSe0eksgJAssGG0k1HQP8uA1DKysm
         NepqPDU7b4JBqK8O0OnE56UKcCbC0y2Hbh8R9CU+73UeGD7CFQvTn7K9wRy5N3iE431p
         9Z6fexvTVsiZbqocbA0BOPVkySpbQ1yku2nvPHOXnsgPFJ5P7Uva3wrozBj2yu1Ci55H
         DC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KY62cZcmvsX3xM03mBE6HBbDYvpNvwvQeq59nLOyZl0=;
        b=FrKQf1fvFuVekYOnIGKcLL4ZH/nbzNoclZQjFxKZcllWuOociyAmku8DBv23/Ph9+j
         e7+D7XZpJIYNr3N3b33zShw3tsZR/S2f/9Bdzi0nOiPvu43VwATUcTV+cIr48oiv77XY
         6HpU6lCw3SxGZG5iIcNTuHjNVLkVoquT5z4CwHFvpBwMa7qhDF2WqucJplFlfJs2mL5Y
         CnRpFC1gw5FVDfFzm1+6mXYrAIUdIKxosryu9eA1VNYsv9t4p/mXzL/fHKStRpS54pWL
         nNsRZAj8hbP/snAHTdd+W04TDCuYWAznuReHTHYzsdj/Yez6j24ibE8v+tdNSfulxy12
         f7RQ==
X-Gm-Message-State: APjAAAVNGgaHPce+VgoDdXMxKgfsyLudT91GixirxkO1r3yFj8jpSKjF
        PexpUrQoqxslic8yE/OIAQgcUx4Iwjnu3YuMsijf
X-Google-Smtp-Source: APXvYqwkLzs8wOmvCMGAVfW9UfG3yFSgEhQJ4PJF36b0OQ8ayRelEpR7nbkBPFNaMcT8MMXULnm3ONsYWWGQxckK3Pg=
X-Received: by 2002:a2e:890c:: with SMTP id d12mr3273555lji.85.1569595745451;
 Fri, 27 Sep 2019 07:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhR+4pZObDz7kG+rxnox2ph4z_wpZdyOL=WmdnRvdQNH9A@mail.gmail.com>
 <c490685a-c7d6-5c95-5bf4-ed71f3c60cb6@web.de>
In-Reply-To: <c490685a-c7d6-5c95-5bf4-ed71f3c60cb6@web.de>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 27 Sep 2019 10:48:54 -0400
Message-ID: <CAHC9VhRk8Gc_Yexrjz5uif+Vj7d+b=uMUytbrmbm2Yv+zoM05w@mail.gmail.com>
Subject: Re: genetlink: prevent memory leak in netlbl_unlabel_defconf
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
        Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Stephen A McCamant <smccaman@umn.edu>,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 27, 2019 at 9:15 AM Markus Elfring <Markus.Elfring@web.de> wrot=
e:
>
> > > In netlbl_unlabel_defconf if netlbl_domhsh_add_default fails the
> > > allocated entry should be released.
> =E2=80=A6
> > That said, netlbl_unlabel_defconf() *should* clean up here just on
> > principal if nothing else.
>
> How do you think about to add the tag =E2=80=9CFixes=E2=80=9D then?

From what I've seen the "Fixes" tag is typically used by people who
are backporting patches, e.g. the -stable folks, to help decide what
they need to backport.  As I mentioned in my previous email this
missing free doesn't actually manifest itself as a practical leak on
any of the existing kernels so there isn't a need to backport this
patch.  For that reason I would probably skip the "Fixes" metadata
here, but I don't feel strongly enough about it to object if others
want it.  FWIW, I play things very conservatively when talking about
backporting patches to stable kernels; if it doesn't fix a serious
user-visible bug it shouldn't be backported IMHO.

This patch is more of a conceptual fix than a practical fix.  Not that
there is anything wrong with this patch, I just think it isn't as
critical as most people would think from reading "memory leak" in the
subject line.  Yes, there is a memory leak, but the kernel panics soon
after so it's a bit moot.  Further, even if the panic was somehow
skipped (?) the memory leak only happens once during boot; the failed
initialization is undoubtedly going to be far more damaging to the
system than a few lost bytes of memory.

--=20
paul moore
www.paul-moore.com
