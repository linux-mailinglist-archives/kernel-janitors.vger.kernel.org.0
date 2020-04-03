Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9482C19DED5
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Apr 2020 21:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbgDCTvy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 Apr 2020 15:51:54 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:33138 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbgDCTvx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Apr 2020 15:51:53 -0400
Received: by mail-pg1-f171.google.com with SMTP id d17so4042830pgo.0
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Apr 2020 12:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9gQpMpP65smhU9h4fCxGG/DL26lj4XPv0cgPw/bIETY=;
        b=h+VsbrHoeL2K991q/zwn2zBwZp9oObUS/klUUb0ba5Xz+CI8LR/NHkR/F9+NMtU/HZ
         U87+M6hEmP1SJq4C+W4r4vex5FZTrwQEPJv/tMZU2eg63xmq/UPkn/qAVTD5e/hme0QT
         sGri8EjFqoyim5+8h9BOT1deGwEssInCFiRU9mUr3AH9No0yrwR+xp647Z6HiKGOJG1l
         mP983EgHZ4cQqTi29cfCcUATvYOvb6gFNAQMr04TXiHczx1J7+WCDiLQYMAoXflVjCeq
         jsxso78SkSipZjyvutqkRlDmhM/D4FjLP/xzCsBYyIcKtJiycSwPno3XFgC6UR1yI0yJ
         12Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9gQpMpP65smhU9h4fCxGG/DL26lj4XPv0cgPw/bIETY=;
        b=QuJj4yyQBj16rD13BGsf1BgIzPPYyY05XwPMHpqdXdtL/BVZNs4QtAolZpTMXEpGFh
         qFxWBrKOam75Xqs6MSPGrgRB8tP63WhQ9pBK8ZFhpEbxLAIYPDbxOJ4eRYhyWq7DrYVx
         9Bq4MFvJsyc2tUHvWQgkojBgr8Ns12IAPuMywBk7kzXLUzCzY9hitS+JSMK+PM1RD0P+
         nwxVQcskketbPoLc8I8GCVDiRmANn5G8xTA/HKimooZNRdJzDgDPnYU4ZtJUMZmzOQe3
         l3XFedYHNNm4CxgQZ1bqlgLIBY5ec3B2HOdu2F0qVBpDUsve5TcXY4Kqu28aElzXdllg
         fjiQ==
X-Gm-Message-State: AGi0PuZ+QfykMMUEoXJGidsQDVXblq+Hc1Fm86SlZkCOjwyTmx2I5w1u
        FVDQKWvyuKefzkG/cORpFGr4PA==
X-Google-Smtp-Source: APiQypK6eaKDH374gWinPksnmI/KFYMVfn16Q0XQhiv0hhYFhpiB0PC8os24xQIIqPfiER3Xbt5/Ag==
X-Received: by 2002:a62:19d8:: with SMTP id 207mr10308346pfz.278.1585943510950;
        Fri, 03 Apr 2020 12:51:50 -0700 (PDT)
Received: from nuc7.sifive.com (c-24-5-48-146.hsd1.ca.comcast.net. [24.5.48.146])
        by smtp.gmail.com with ESMTPSA id h15sm6375239pfq.10.2020.04.03.12.51.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 03 Apr 2020 12:51:50 -0700 (PDT)
From:   Alan Mikhak <alan.mikhak@sifive.com>
X-Google-Original-From: Alan Mikhak < alan.mikhak@sifive.com >
To:     kishon@ti.com
Cc:     lorenzo.pieralisi@arm.com, bhelgaas@google.com,
        linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH][next] PCI: endpoint: functions/pci-epf-test: fix memory leak of buf
Date:   Fri,  3 Apr 2020 12:51:34 -0700
Message-Id: <1585943494-23977-1-git-send-email-alan.mikhak@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20200401223541.403438-1-colin.king@canonical.com>
References: <20200401223541.403438-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

Please note a similar leak in pci_epf_test_write().

Regards,
Alan Mikhak

