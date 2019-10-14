Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04472D638E
	for <lists+kernel-janitors@lfdr.de>; Mon, 14 Oct 2019 15:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731163AbfJNNQA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 14 Oct 2019 09:16:00 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:45529 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731002AbfJNNQA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Oct 2019 09:16:00 -0400
Received: by mail-yw1-f67.google.com with SMTP id x65so6073828ywf.12
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2019 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rKzkD7UkgaWpOKYsj5nwSWLCziwC7D7d56zQ7swMrAI=;
        b=aX3aF1abTrK4DZPP1VXH7V63n4tcARLqnCdHUIw/0zQcYGerbGphhMaV2qS0LD4ygj
         WmLTa6VBPfl9WEC0bsubnLXisKzrfkRaj2nPdnAGLbMHZpHHFMK/QByon8GcaLapqhaB
         Hh20NYRww/r9pbuaPcK0i7bBZhe7qFfk+q2gmZve1915bOxu5aDJlQbtRsrZmt/2BeHf
         m/Bl33FbTefIKsxnuKnaa9j1BhCYDXmgH1RTyLSrwjLNLYJphHUMDpZRufT5iH0cOq51
         gkbfYMW53Zlrv4bSzDmpjgPQwa9JNdTg9hgV4hHmPvsMck4ed/oG9K9ZztrXSeE/0FVR
         VY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rKzkD7UkgaWpOKYsj5nwSWLCziwC7D7d56zQ7swMrAI=;
        b=UulTALbgrfh8WQVwbWj2i+5kVlOhFskrYGCXt6QYZSGzIeqSviCrGCMMX/eMNhoYwe
         8lVnu7iHi42AAHctm4WEjGeCsvKKY+v73BTQYeaS5o8MfTPSt5xCTQPUcmfJUSZChqI5
         4s1dvrM9RaYr8bctXqx0G9fUqtUH2AeJLkWvcYkxKpy/SWICt1glVoElFdu9lci+YWcg
         e7EwrwmyHxr57Asd2Ytrj0ZLcWc69aA/SM5vu6ute8kdvqq+h6BtwD27FKfBu01gIPIC
         KWoRGQhHO/QSO7C8ShaDVALIF7geZZWrEOZ3zU2QM+EuN6tzJbVFMlwHcCd0331VEVvk
         qosQ==
X-Gm-Message-State: APjAAAXQgNNtRyAPahwNIkBPt0dHSyULK4F1qyBRs6VytRq7weDPZgm/
        ca0mWrwx6S0A7dND2vJLH0/fyQfGkXUEIai8+DKQSA==
X-Google-Smtp-Source: APXvYqz1nkS4tN4mj3r69vkopL1EEw079aUO9RrrSp63cjG2gpbD8ecdWROUARuvebqXTvvtfgHcpUEQjefEf5mkQ1E=
X-Received: by 2002:a0d:ca0b:: with SMTP id m11mr12506127ywd.466.1571058959291;
 Mon, 14 Oct 2019 06:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <a219235e-bad5-8a9d-0f3e-c05d5cb11df1@web.de> <124b41aa-7ba5-f00c-ab73-cb8e6a2ae75f@gmail.com>
 <fc39488c-f874-5d85-3200-60001e6bda52@web.de> <0984a481-f5eb-4346-fb98-718174c55e36@gmail.com>
 <248c2ca6-0c27-dc62-6d20-49c87f0af15f@web.de>
In-Reply-To: <248c2ca6-0c27-dc62-6d20-49c87f0af15f@web.de>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 14 Oct 2019 06:15:48 -0700
Message-ID: <CANn89i+WzeMhCysz7QngWM7iMMv1GAuzVez0Gviiud5MZoKO-w@mail.gmail.com>
Subject: Re: tcp: Checking a kmemdup() call in tcp_time_wait()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Eric Dumazet <eric.dumazet@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Hideaki Yoshifuji <yoshfuji@linux-ipv6.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Navid Emamdoost <emamd001@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 14, 2019 at 5:51 AM Markus Elfring <Markus.Elfring@web.de> wrot=
e:
>
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/net/ipv4/tcp_minisocks.c?id=3D1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#=
n306
> >>>> https://elixir.bootlin.com/linux/v5.4-rc2/source/net/ipv4/tcp_miniso=
cks.c#L306
> =E2=80=A6
>
> >> Can an other error reporting approach be nicer here?
> >
> > There is no error reported if kmemdup() has failed.
>
> How do data from the Linux allocation failure report fit to this informat=
ion?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst?id=3D4f5cafb5cb8471e54afdc9054d973535=
614f7675#n878
>

This is coding style for newly submitted code.

We do not refactor code to the latest coding style, this would cost a lot.

Especially TCP stack that is quite often changed.

>
> > timewait is best effort.
>
> How do you think about to return an error code like =E2=80=9C-ENOMEM=E2=
=80=9D at this place?

tcp_time_wait() is void, the caller won't care. I told you time_wait
is best effort.

What is the problem you want to solve _exactly_ ?

Have you seen a real issue, or should you augment your static analyser
to not complain on :

ptr =3D kmemdup();
BUG_ON(<any condition>);

(<any condition> being different than (ptr =3D=3D NULL))

I believe we have enough real bugs to fix.
I would prefer to not spend time arguing for every single BUG() or BUG_ON()=
.

Thank you.
