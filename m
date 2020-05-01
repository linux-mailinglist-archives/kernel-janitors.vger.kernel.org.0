Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C7D1C1E19
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 May 2020 21:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgEATzI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 1 May 2020 15:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbgEATzI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 May 2020 15:55:08 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2543C061A0C
        for <kernel-janitors@vger.kernel.org>; Fri,  1 May 2020 12:55:07 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id d16so8097741edq.7
        for <kernel-janitors@vger.kernel.org>; Fri, 01 May 2020 12:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vd/NTDk45CB/fePqWXBGsmO9Bn5XFylQDEfLobAzR8U=;
        b=MHcfvujWPP0pZkfx1BjaIjxDsUHYxnm+2SOsoecV2W9XTF4+TQsRhCgDL8Xvjw7VAb
         YGdP/MC77O10pa91UP/c6c+vXCfKrKEDUM7tEdZwaDo9vzO4eoci+38a2QNrlfVPdU8m
         HsXaLjqCybKIppphjzhNNX+GGzSoyiIRRyjxNe0wJUWFjfAX9IkB7VYk4so5WYJHK9V9
         /PBgfuJTjexnGBUtx3HZ65s1EZHmxkqjtU3vNOw1lu8ahxSWmtWzz/qkogv2Y2yF6Z+I
         pAL5RaVLk6onVVUL3s206o0hvTmhZ56elUbpvrSdkixW0+Mv0IrWp+Oc+WZ7+Jg0+smm
         4L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vd/NTDk45CB/fePqWXBGsmO9Bn5XFylQDEfLobAzR8U=;
        b=WnfFddwIwS9NULsyXlv+v4NHCRzQHxV5e+2Zx9M12ok/KeXWSBV5oyq8Aig0hAa/aO
         M3QQBzw9RYHQizQUhS3BtyGxeRsfLHPr1nM3pGU56QX5/r+V/1FO8hM4ISpOctg7Kb/W
         5vU+fG5VPPcPrlicGJzw6zpzpuUmZWv3+9k8OyOc+2UklxyRLnEwSQR0LNJfslEUl1EH
         cqIBZ5MWPqxpeJQgQToxRW/zzzK84nns0IQIz+kJLQLtqKKejGuw/s8ln4HJ6mThkkPR
         QNLhVoc+Y9Cz1U5jJ3iyLi580JeoSPUcfaEsGmfe8tsZgiAJccuKabRh8gIOpMpZuNaZ
         6OVw==
X-Gm-Message-State: AGi0PuaP+MATsUM0LLZBdbTx7bVi1/o/xzyoQcQ8Ubbwq+Qaj2NRs1N8
        Vzp5tagpjfWy+ptR82O0UXL1GIdFwaLcmz76iiF2
X-Google-Smtp-Source: APiQypLn7W1R7xYVvSzl2/q9NQc0qIuXpz2ML3a6e//ZLcQp29/ArK0d2NQHLCp0a0N5Q0Su7JIi5vTJXOpyJ9+yalw=
X-Received: by 2002:aa7:cb0f:: with SMTP id s15mr4892967edt.164.1588362906610;
 Fri, 01 May 2020 12:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200501195111.3335258-1-omosnace@redhat.com>
In-Reply-To: <20200501195111.3335258-1-omosnace@redhat.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 1 May 2020 15:54:55 -0400
Message-ID: <CAHC9VhT7EDa_HJpeq476G=euHz3=p5b4u2KONeMEAMef=ASy8A@mail.gmail.com>
Subject: Re: [PATCH] selinux: fix return value on error in policydb_read()
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     selinux@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
        kernel-janitors@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 1, 2020 at 3:51 PM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> The value of rc is still zero from the last assignment when the error
> path is taken. Fix it by setting it to -ENOMEM before the
> hashtab_create() call.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: e67b2ec9f617 ("selinux: store role transitions in a hash table")
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  security/selinux/ss/policydb.c | 1 +
>  1 file changed, 1 insertion(+)

Here I was just about to reply to your other patches that patch 2/4
looked fine to me but I was going to hold off on applying it until
this patch came through :)

Merged into selinux/next, thanks.

-- 
paul moore
www.paul-moore.com
