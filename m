Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F91731FC26
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 Feb 2021 16:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhBSPkQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 19 Feb 2021 10:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhBSPkP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Feb 2021 10:40:15 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E86C061756
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Feb 2021 07:39:32 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id lu16so14131000ejb.9
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Feb 2021 07:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tLTA7FtePU+dZNp41QMgufF0dTfbm8VBzRM8fJ89BRY=;
        b=sDnU+xsNSISI47NUzHuG6iz1qb+e3QU8NY5m3se39I6xdjgfmz4soMB4C40+NDA8FM
         7OMisFUw0H588yRKLFcET4zTiGMFL7okEuFTJrx2id6MeSnX91GvssNIzVMUEROnkT82
         lZuecmk4c5WqOo2klU3VagkRPxXypCnBb6XApE27ZfZzfWkY6ThBmWfTfPJ5bvLjcIB7
         2JZA8+kxPc7QWlVke8mbDE0WB6OgsRYBLD+R8qQ/EJlpoNsIu6t/ZrRDaYUj+R+KRFe9
         G9PTQAFDjoPx5jYkpTnXpWvmddJOBZE3CoiWMBtQskuVBVSZOWPffafd3hNx8y4RJAr8
         6SSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tLTA7FtePU+dZNp41QMgufF0dTfbm8VBzRM8fJ89BRY=;
        b=HSqEdNyTk7K3WpzVImJiLlvPD7Il1jszeR3JGm11+571ahYDeeIOC3K3ZO9XQYyOjj
         MQxbshrqobbjdrBnqSkI2scWf51152NOJN5pR8NhssQ9bETz5NSBf3U0oDOei5Uu/nbz
         0mnKxbgJtqzYfAKz0Wf+98TUfnhry8LAdQB4mvucoWZ+X0canHYd8FDjaLri6luwXzkI
         cWBeCk7N0yd36qQMPzWqM1btKBW93cqXa1Ks58xtZjfskGAi4cZYvZNDo3J1ZWYjUqk2
         Sj7octZiHyjQKJyfG0V7NFRroe0ysmxmF2Dyj7YsovjLa2wVqpzsyhAtfYyfHZa7g59I
         OC1w==
X-Gm-Message-State: AOAM53174iV5M+6CH67YBd5EzSxrDTn+xtTVxvhuG8vKL6re/pXtjlgR
        VDw/u/+m/AsKcCVdpJKp0AmMON6Ud4DHYV/1CZOBJA==
X-Google-Smtp-Source: ABdhPJwh1/ZWcZ2N8I4xU2iWDfMsnReGdFlU4wq/EF39Z40noDKMmZJCBlRafzsDbQZHsTP0uMuOyikCYSEzh3laL2M=
X-Received: by 2002:a17:906:cc91:: with SMTP id oq17mr9053192ejb.45.1613749171563;
 Fri, 19 Feb 2021 07:39:31 -0800 (PST)
MIME-Version: 1.0
References: <YC+K3kgzqm20zCWY@mwanda>
In-Reply-To: <YC+K3kgzqm20zCWY@mwanda>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 19 Feb 2021 07:39:23 -0800
Message-ID: <CAPcyv4jCAcZH3C-kSbYVjBu34g60aYzQpwANjXecY-ziUKxguQ@mail.gmail.com>
Subject: Re: [PATCH] cxl/mem: return -EFAULT if copy_to_user() fails
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alison Schofield <alison.schofield@intel.com>,
        Ben Widawsky <ben.widawsky@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Ira Weiny <ira.weiny@intel.com>, linux-cxl@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Feb 19, 2021 at 1:55 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The copy_to_user() function returns the number of bytes remaining to be
> copied, but we want to return -EFAULT if the copy doesn't complete.
>
> Fixes: b754ffbbc0ee ("cxl/mem: Add basic IOCTL interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Looks good, Dan, thanks!
