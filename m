Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BBC24E4EE
	for <lists+kernel-janitors@lfdr.de>; Sat, 22 Aug 2020 05:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgHVDfu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 21 Aug 2020 23:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgHVDfp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Aug 2020 23:35:45 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 505FCC061573
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Aug 2020 20:35:45 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id 2so3137272qkf.10
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Aug 2020 20:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:in-reply-to:references:mime-version
         :content-transfer-encoding:date:message-id;
        bh=KG6D35LrETrIbEfRR6i8e5kjQoSsAlfAd76Negglopk=;
        b=ZLiF4nKTa6K1HQaBpXgSIFMMvGzHJi8jg30bu8smasWga6F6Z6Dp/z48oYS+prRwEL
         j91ry5qS9XZJsCmKuR0SiRVobdT73zx55YSa01bGbr35MgE40OO0yjBa4C0nVAUpIqCa
         dCzOwPEUo6ug+qKL++tJRdAfIf0ARwvMUC9aF+LVLfYQsOJGF4OwXNu+UY20YhvfHndb
         POpJoYvGm2z1DGNwoSYJe1XWaDa1zTonVDmD+/T9dH1NlLgIUCRKkivCaUGd3qmnyn1H
         KNKTsIHJ9OR+ijbYH+Oxw37DIcwj+Ro6f/A+TZysAycsp51Sp+/rKKFiwI+scuouCpSQ
         J0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :mime-version:content-transfer-encoding:date:message-id;
        bh=KG6D35LrETrIbEfRR6i8e5kjQoSsAlfAd76Negglopk=;
        b=OrYozi4PrW7Dwv+ca/Qc5eTZAd1gKUy+3VUrZD+eM7miaVnC2vPU2lKiOph37b0a5Z
         u8p+cxVF0Z0tpOTJtRWdrP5C03RxSbKgre0uZCv63yD3Oeqq6qLc7VUqWAJNQt2yPlkj
         p1hyRUdL+tHLv0CTnyO29pB9PkJPIWuxhrWVE6w/Iv6H5VWSLyCGgK7wA+zydDsDJ+9S
         sx8O+D5z4DD0hQsavUavoY/TItZN9AAYG8tqj2Lgt2lCqCG/QQYy4py+hmxFSCRGVJH3
         BHYI1wdYcA9jNTjf5EqyWQFj3tCgIocjMrU0YN65dWsEUnJCbituyAR8GeDnluf1Llzg
         090g==
X-Gm-Message-State: AOAM530J8/MGEYLWQY/tg0JJvn8a3UCIVHa5Mqqfxa4hMk75mQBXCLTJ
        vMIFGmQIDaVfTwV0kpUIcLORog==
X-Google-Smtp-Source: ABdhPJyXiMG8R/vxxpTmr6jwH49uQw4sDsejPXcgr60otWQbrUaOArpxK+wbVrBg76CIxpKdyIKIUA==
X-Received: by 2002:a05:620a:128e:: with SMTP id w14mr5216948qki.97.1598067341235;
        Fri, 21 Aug 2020 20:35:41 -0700 (PDT)
Received: from turing-police ([2601:5c0:c000:a8c1::359])
        by smtp.gmail.com with ESMTPSA id w44sm4481201qtj.86.2020.08.21.20.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 20:35:39 -0700 (PDT)
From:   "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Joe Perches <joe@perches.com>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Andrew Morton <akpm@linux-foundation.org>,
        cocci <cocci@systeme.lip6.fr>,
        Giuseppe Scrivano <gscrivan@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Whitcroft <apw@shadowen.org>
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re: [PATCH] checkpatch: Add test for comma use that should be semicolon)
In-Reply-To: <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org> <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com> <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com> <alpine.DEB.2.22.394.2008201021400.2524@hadrien> <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com> <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
 <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1598067338_2109P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 Aug 2020 23:35:38 -0400
Message-ID: <162653.1598067338@turing-police>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--==_Exmh_1598067338_2109P
Content-Type: text/plain; charset=us-ascii

On Fri, 21 Aug 2020 18:08:08 -0700, Joe Perches said:
> (forwarding on to kernel-janitors/mentees and kernelnewbies)
>
> Just fyi for anyone that cares:
>
> A janitorial task for someone might be to use Julia's coccinelle
> script below to convert the existing instances of commas that
> separate statements into semicolons.

Note that you need to *really* check for possible changes in semantics.
It's *usually* OK to do that, but sometimes it's not...

for (i=0; i++, last++; !last) {

changing that comma to a ; will break the compile.  In other cases, it can
introduce subtle bugs.

> > I do appreciate that coccinelle adds braces for multiple
> > expression comma use after an if.
> >
> > i.e.:
> > 	if (foo)
> > 		a = 1, b = 2;
> > becomes
> > 	if (foo) {
> > 		a = 1; b = 2;
> > 	}

Yeah.  Like there, if you forget to add the {}.

--==_Exmh_1598067338_2109P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBX0CSigdmEQWDXROgAQKNCQ/8DDgTmFpZiCAqadYFLPHzj4cazPnhAUXW
F7pYc//dQ403pifqc84z6kGRQsocCpaXTMRzYfSe/EMYP/oCLxYr+qvbG2UJg1qs
ltyI+7Z3UY0lz/OxBmzwm+/QmCc5YHpEZ+eK4zmQwgP4KfgjD8BDrraWqAueAHi2
mOBcWxQ2/KcYwN4dvDJ3ESRJyiws6KOfCe4a216h1mpc+u94zgmRUkUXBxVNZQB+
Ew3a+GI5cLTAXt9JbSrakXqoj/sH9+GqJnJ1T0flu/mBhs5gRRXDmcfoEDgxUeJQ
T+5Yunwj00vqcCql+G6jOaLvBcPnxI2xx7UaOIzl3JO+4wQZOjj6JC3EJjpLYtLL
RZGwHt/35XSJV6Tci/tAE/5H7twYwhig68ChnuGAOgxm2yg1sUxpKdgl/K6u+qOs
xIzp1f66xWljUPSx7xJxxc1445gd1I6udjeY8tUP2wVLlUseD4L2JwJInRvfufy5
7dN3nTy4e1s3Vu5P6CK4PntJagNPNm83EQtBk9a0A3skoPZyADW1UUCPRhIdy/te
Z1IC/I3rGRw6lVzVZR8tXox70QhVBRHLL99Zxv4w5DedB0dDNsu7//pE3YSQrRW+
t2vRvfBi0Nz6MZVxMMV/uMHa4sqJjqt9T4JD3uijdvQFkMxtm5o6cSXWuAobIU/T
w6QQ1Tjr1Z4=
=9BEy
-----END PGP SIGNATURE-----

--==_Exmh_1598067338_2109P--
