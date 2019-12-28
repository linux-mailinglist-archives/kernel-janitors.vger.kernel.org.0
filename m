Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40F0112BBEF
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Dec 2019 01:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfL1AcT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 27 Dec 2019 19:32:19 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:53730 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbfL1AcS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Dec 2019 19:32:18 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 22BA5154D114C;
        Fri, 27 Dec 2019 16:32:18 -0800 (PST)
Date:   Fri, 27 Dec 2019 16:32:17 -0800 (PST)
Message-Id: <20191227.163217.1055599246835779278.davem@davemloft.net>
To:     maowenan@huawei.com
Cc:     andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
        linux@rempel-privat.de, marek.behun@nic.cz, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: dsa: qca: ar9331: drop pointless
 static qualifier in ar9331_sw_mbus_init
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191224115812.166927-1-maowenan@huawei.com>
References: <20191224112515.GE3395@lunn.ch>
        <20191224115812.166927-1-maowenan@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 27 Dec 2019 16:32:18 -0800 (PST)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 24 Dec 2019 19:58:12 +0800

> There is no need to set variable 'mbus' static
> since new value always be assigned before use it.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied, thank you.
