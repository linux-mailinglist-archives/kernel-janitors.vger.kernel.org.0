Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5B1B19616F
	for <lists+kernel-janitors@lfdr.de>; Fri, 27 Mar 2020 23:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgC0WpE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 27 Mar 2020 18:45:04 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40057 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727655AbgC0WpD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Mar 2020 18:45:03 -0400
Received: by mail-ed1-f68.google.com with SMTP id w26so13248387edu.7
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Mar 2020 15:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/LGuc0QqW9HR71Y1NNbAkC8Bf5W/OzoGDIgpyPzWX5k=;
        b=xSOnox+1TN9e9prVqWp62ZCF3N/UkOZnjrZvSo7uZZHGBIs480j52MjNHh+TbQoueQ
         DVqn7TmWHGc3Nu/z7VBqVnEHJ53ndRea5gywFzuSDnMCz3fQdoR25ZMt2x7hb1P8V25W
         IfO+S+4V7ixws6ZtcIaQArFxwnKE75D9vC1Pv246btnV03YxkXfMiIXaju+QBWEbPVsB
         DiIOkT2ejeaX5DcN93WU5FVtzcD10HpTGZkIvQAEFX7710KHXupTRPnHnxtWOzTNw49a
         aqS9exTHbBGD6cEnFFiMc2s1GchbIdLRf9tY1V4ACtXUnNZgNF5orFPB9hF8mjOeTCJC
         Wkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/LGuc0QqW9HR71Y1NNbAkC8Bf5W/OzoGDIgpyPzWX5k=;
        b=j8a5gSwZ6Bq+XvmFxj2WGOmh89366gy+seqhMIaoAzTtX76+P2nA/QjKO0yP/BdC6c
         SuWoUXBI59QgrYds32/KrNjTFGauqm9i9KtbIjkuw6HH0Ok5+JMyBumPC4AFUsvSKRB6
         QNWpXGOCYWV1VuZiXxE3I58krVX4hjGfA21OZwh5FFUJK7CHCgZ1E0ZGywVnj/NNTtzV
         Uy2W0RjG+fN8pcw2qk22G1wm4oz7GS8YIwREX905mbHvjVD1hTyx+/gZnPx/Rf1Phded
         uSb1xFQDxJ9B2+AzNnQ+lFi+fR2IBoJM3QH1mlfiwio+q8UEPGvyTLYtINNn4waAxGbx
         /iyw==
X-Gm-Message-State: ANhLgQ25qtL5YPYE3WIJNLlWoHCiTV8NNxLMIHeUtEE2ihIOMIB7KiXF
        U1SSSiE9hKiwNomIEcarockmE1uzgwHDxxjfMkCQ
X-Google-Smtp-Source: ADFU+vtPz2f20HeMrGRumvzvtd33Lj903GfTooGJ3K0DV5XYxoq4cFDiri2nBc6zrER/kask/V6CYP3kgc4C49YuTBQ=
X-Received: by 2002:aa7:dd01:: with SMTP id i1mr1459195edv.164.1585349100363;
 Fri, 27 Mar 2020 15:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200327174402.351334-1-colin.king@canonical.com>
In-Reply-To: <20200327174402.351334-1-colin.king@canonical.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 27 Mar 2020 18:44:49 -0400
Message-ID: <CAHC9VhQOdoNXHjymbMCh1p0Bun5+bzxykhWzPNtjcwoEJ0cAjA@mail.gmail.com>
Subject: Re: [PATCH] selinux: clean up indentation issue with assignment statement
To:     Colin King <colin.king@canonical.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 27, 2020 at 1:44 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The assignment of e->type_names is indented one level too deep,
> clean this up by removing the extraneous tab.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  security/selinux/ss/policydb.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

I generally dislike style/formatting only changes, but one could argue
that this is just plain wrong regardless of how you like your code to
look.

I also dislike merging changes into selinux/next when we are at -rc7,
but this is trivial and obviously correct.

However, despite not wanting to merge this into selinux/next I decided
to do just that - thanks for the fix. :)

> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index 932b2b9bcdb2..70ecdc78efbd 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -1219,10 +1219,9 @@ static int read_cons_helper(struct policydb *p,
>                                 if (rc)
>                                         return rc;
>                                 if (p->policyvers >=
> -                                       POLICYDB_VERSION_CONSTRAINT_NAMES) {
> -                                               e->type_names = kzalloc(sizeof
> -                                               (*e->type_names),
> -                                               GFP_KERNEL);
> +                                   POLICYDB_VERSION_CONSTRAINT_NAMES) {
> +                                       e->type_names = kzalloc(sizeof
> +                                               (*e->type_names), GFP_KERNEL);
>                                         if (!e->type_names)
>                                                 return -ENOMEM;
>                                         type_set_init(e->type_names);
> --
> 2.25.1

-- 
paul moore
www.paul-moore.com
