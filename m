Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D68E1DCAC4
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Oct 2019 18:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394553AbfJRQQp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 18 Oct 2019 12:16:45 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46394 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394278AbfJRQQp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Oct 2019 12:16:45 -0400
Received: by mail-ot1-f65.google.com with SMTP id 89so5402143oth.13
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Oct 2019 09:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5yvne9gR5NX8diVvQ4owtsBgM2mX2Xb63EAQlH8HuKk=;
        b=pgtBz1yNdYHNJjI2qaamNbVambOK9yJQgeULnvuFlYsPJ9Rjw1N2d9H+8UMr9eWj3b
         9liGZz4th/SqPt1msrv5ZhJ9X9azJiH5HNasIcgScD598JWlRWnzuFGS5AXysqgA6HLk
         gwKe5zRem+TLue5OOjkQh/IQhuxj1AIg1HfVEcb//hOpoKtgw5H/2dP9kiqZLYOx1QBF
         SrL6WQzrY22NyTxaL8lcVppjuosDDGcqNgrGBBEmn5Oh8WYlAZ4hC7itFji5GF+ZbDMS
         QAID4k1OHaUbZNUNfqTZiKItV2l49Gld9cwb/kfcjD69FsTkXtRptAEHg/UKD/mgPmFj
         rfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5yvne9gR5NX8diVvQ4owtsBgM2mX2Xb63EAQlH8HuKk=;
        b=rKyyn6GOT/34We1gW0J8cPeNaywkNtXh1LfFuggWB6NKsoiRO6k+cFZVvEkr9Xe1PI
         LeG/g63AJx2RBnsXJUg3Fg7neOkIUoXNirs+0OTYI9yr810iKINMLDU6wgWu/Gw4snUB
         pwPr1TiYh/SAxVOG0sxxXcJEL8FeVSceEu0GmT1DDJyRrU80RT+tyZ/kJymayHg6CKlW
         z1iaNxKgjteCWlycq5XvesLjo/yAIJJBbCn10pRbau/umRRfaXAOB1ociv5fkufu8znu
         +CARjxhkqOD2pO8hIJidyjv246eh+BrPzU8TJiiBmI9pyncw8Urlvt5GqGvbB5Aimi9Q
         Ridg==
X-Gm-Message-State: APjAAAWSFpm/6R+D+hi4NTGU4jLZdqo9DfiIfbajquQ6tlKRDLbwsynw
        bSyCat5gTUUd80a8Fh/FUEnsfXTP+nqtlsIyQepVSQ==
X-Google-Smtp-Source: APXvYqyblv3J/xJHeQdDv4C30Sjo0Fd3shSE2mry0JpF/Y+67xf+0kg0irQ3y+5bIupfWe2BJ5cEte7rGplRl+cUL8w=
X-Received: by 2002:a9d:7c92:: with SMTP id q18mr8454155otn.363.1571415404227;
 Fri, 18 Oct 2019 09:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191018123534.GA6549@mwanda>
In-Reply-To: <20191018123534.GA6549@mwanda>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 18 Oct 2019 09:16:33 -0700
Message-ID: <CAPcyv4jm7kiayfHnBcm7mNW2NeJ81LeUVphMYG0Tq50is-tQ0A@mail.gmail.com>
Subject: Re: [PATCH] acpi/nfit: unlock on error in scrub_show()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Keith Busch <keith.busch@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 18, 2019 at 5:37 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We change the locking in this function and forgot to update this error
> path so we are accidentally still holding the "dev->lockdep_mutex".
>
> Fixes: 87a30e1f05d7 ("driver-core, libnvdimm: Let device subsystems add local lockdep coverage")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good to me, thanks Dan.
