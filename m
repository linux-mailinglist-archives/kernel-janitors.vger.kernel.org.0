Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE691C1AC9
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 May 2020 18:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgEAQrB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 1 May 2020 12:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728896AbgEAQrA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 May 2020 12:47:00 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EBEC061A0C
        for <kernel-janitors@vger.kernel.org>; Fri,  1 May 2020 09:47:00 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id x1so7917449ejd.8
        for <kernel-janitors@vger.kernel.org>; Fri, 01 May 2020 09:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QNT4/Sthucicoz3OfYeIi+e2sDpr2i8vBnDynJ35Ebk=;
        b=rSfAU2TmEk6FBuKjKXSTI0LO8nMvtqW2/yjEC3/vzKYlLHOVZLomflZPtCvyqxM9u2
         OoRwF020lTWMsQeX6+ddUBM8M6ARhRapK+2lL6AmOdUJaxHa+MzkFvBYTsm5VyrbfpsK
         ewy9A3qeaVt8vYQOA6dB8s+c5khNFj5uS6iu+yIB1pkz/in8IrlEa4qbDoPi4QSiu9yK
         GbX7LiwGYlZPaYHFhkv7KUGM39Yq7YbY8mztL094aLemI+7Jb64o9xAJoONp1yQ0KcIM
         osDIuyiiKj6GZ59nErVvybAuNw7yJ528u9gf7vLliJgnM/+vGXBGfKWW9DtQWA5rMyJc
         hF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QNT4/Sthucicoz3OfYeIi+e2sDpr2i8vBnDynJ35Ebk=;
        b=J4YPLptXu1G/Y6ul8Xsh6rpwF4gLdCAJSqCq2dsDfhPVNHLahqJ8w3U/lDbdfexu8L
         0UXSPo97hS4ilcCzJOMD8/zGR26/ArtljwazkkSJBH16lugrHOB486O/PaNEFjNI6ME7
         pbSD1BHJ88l5g6U9E0lqIDYdT6oQZSbDu4fa+XVOXlKWTsplBm2HlyfWH6S6VjSBU7Z8
         r+h/qKMFEnp0xoOZ05GoEWAPOJllcabBjkIQeR2bQTKiF7dAWlKmJ46BUX4VX4q5utEU
         xjTw3A7Mag4QAF6PwX8PwbXLG+kFcCdYXHdzXLC+npQ1C6NVXHtOp5N5C6tGBsT6gpO5
         t42A==
X-Gm-Message-State: AGi0PuarqEYXWIpBf51e4ANxFHZOiGs++58STStnsa5COwZFcJrYeF7u
        rKkMBB3wqQoRUqZ9VAK46yKkdhn2WqdHNYjOvtQn
X-Google-Smtp-Source: APiQypLgXEdp+smo5hw20ykRw2ysgbMFkkc78aYzE9Xkik+QAnkiiZ9wRky25HWgHLxlILzDmA6dyAEDnNFSY0xWC2o=
X-Received: by 2002:a17:906:29c4:: with SMTP id y4mr4088167eje.95.1588351618822;
 Fri, 01 May 2020 09:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200429073053.83660-1-weiyongjun1@huawei.com> <20200429130738.GQ2014@kadam>
In-Reply-To: <20200429130738.GQ2014@kadam>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 1 May 2020 12:46:47 -0400
Message-ID: <CAHC9VhT1-rV3heNWxcKo58AVsvhGeX5=oTQY8d8uahpMhwbJrA@mail.gmail.com>
Subject: Re: [PATCH -next] selinux: fix error return code in policydb_read()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Jeff Vander Stoep <jeffv@google.com>,
        selinux@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 29, 2020 at 9:15 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Wed, Apr 29, 2020 at 07:30:53AM +0000, Wei Yongjun wrote:
> > Fix to return negative error code -ENOMEM from the kvcalloc() error
> > handling case instead of 0, as done elsewhere in this function.
>
> Please add a Fixes tag and Cc Kent.

Kent?  Who is Kent?

-- 
paul moore
www.paul-moore.com
