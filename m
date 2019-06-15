Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44E2D46DC3
	for <lists+kernel-janitors@lfdr.de>; Sat, 15 Jun 2019 04:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfFOCVu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 14 Jun 2019 22:21:50 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:57410 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfFOCVt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Jun 2019 22:21:49 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id F152713407F73;
        Fri, 14 Jun 2019 19:21:48 -0700 (PDT)
Date:   Fri, 14 Jun 2019 19:21:48 -0700 (PDT)
Message-Id: <20190614.192148.1227986231677887217.davem@davemloft.net>
To:     dan.carpenter@oracle.com
Cc:     linux@armlinux.org.uk, ruslan@babayev.com, andrew@lunn.ch,
        f.fainelli@gmail.com, hkallweit1@gmail.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: phy: sfp: clean up a condition
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190613065102.GA16334@mwanda>
References: <20190613065102.GA16334@mwanda>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 14 Jun 2019 19:21:49 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Jun 2019 09:51:02 +0300

> The acpi_node_get_property_reference() doesn't return ACPI error codes,
> it just returns regular negative kernel error codes.  This patch doesn't
> affect run time, it's just a clean up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next.
